
# Create a VPC to launch 
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = "${var.enable_dns_support}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"

  tags {
    Name = "${var.vpc_name}"
  }
}

# todo: dhcp options and association

# Create an internet gateway to give subnet access to the outside world
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.igw_name}"
  }
}

# -------------------Start with pubic subnet-----------------------------------------

# start with pubic subnet
resource "aws_subnet" "public1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_public1_cidr}"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-1a"

  tags {
    Name = "${var.public_subnet_name}"
  }
}


# ----------------Ending with pubic subnet----------------------------

# ----------------Staring with web layer subnet-----------------------

resource "aws_subnet" "weblayer_private1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_web_private1_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "ap-southeast-1b"

  tags {
    Name = "${var.private_web_subnet_name}"
  }
}


# -----------------------Ending with web layer subnets ----------------------------

# -----------------------Staring with app layer subnets ----------------------------

resource "aws_subnet" "applayer_private1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_appserver_private1_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "ap-southeast-1a"

  tags {
    Name = "${var.private_app_subnet_name}"
  }
}


# -----------------------Ending with app layer subnets ----------------------------

# -----------------------Staring with db layer subnets ----------------------------

resource "aws_subnet" "dblayer_private1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_dbserver_private1_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "ap-southeast-1b"

  tags {
    Name = "${var.private_db_subnet_name}"
  }
}


# -----------------------Ending with db layer subnets ----------------------------


# ------------------------ Nat ------------------------------------

# Elastic IP for NAT gateway
resource "aws_eip" "nat" {
  vpc      = true
}

# NAT Gateway
resource "aws_nat_gateway" "nat" {
    allocation_id = "${aws_eip.nat.id}"
    subnet_id = "${aws_subnet.public1.id}"
    depends_on = ["aws_internet_gateway.igw"]
	
	
}


# ------------------------------------------------------------
resource "aws_route_table" "public" {
    vpc_id = "${aws_vpc.vpc.id}"

   tags {
     Name = "${var.public_route}"
   }
}

resource "aws_route_table" "private" {
    vpc_id = "${aws_vpc.vpc.id}"
 
    tags {
		Name = "${var.privte_route}"
	}
}


# public route 
resource "aws_route" "public-igw-route" {
  route_table_id = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.igw.id}"
}


# private route
resource "aws_route" "private-natgw-route" {
  route_table_id = "${aws_route_table.private.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = "${aws_nat_gateway.nat.id}"
}



# Route the   subnets

resource "aws_route_table_association" "public1" {
  subnet_id = "${aws_subnet.public1.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "webprivate1" {
  subnet_id = "${aws_subnet.weblayer_private1.id}"
  route_table_id = "${aws_route_table.private.id}"
}


resource "aws_route_table_association" "appprivate1" {
  subnet_id = "${aws_subnet.applayer_private1.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "dbprivate1" {
  subnet_id = "${aws_subnet.dblayer_private1.id}"
  route_table_id = "${aws_route_table.private.id}"
}



output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
output "cidr_ip" {
  value = "${var.vpc_cidr}"
}

#----public subnet ids------------------
output "public_subnetid1" {
  value = "${aws_subnet.public1.id}"
}


#----web layer subnet ids------------------
output "weblayer_subnetid_private1" {
  value = "${aws_subnet.weblayer_private1.id}"
}


#----app layer subnet ids------------------
output "applayer_subnetid_private1" {
  value = "${aws_subnet.applayer_private1.id}"
}

#----db layer subnet ids------------------
output "dblayer_subnetid_private1" {
  value = "${aws_subnet.dblayer_private1.id}"
}


#----vpc layer vpc cidr------------------

output "nategateway_id" {
  value = "${aws_nat_gateway.nat.id}"
}

output "aws_route_publictable_id" {
  value = "${aws_route_table.public.id}"
}

output "aws_route_privatetable_id" {
  value = "${aws_route_table.private.id}"
}









