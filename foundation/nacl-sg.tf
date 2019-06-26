resource "aws_network_acl" "public" {
  vpc_id = "${aws_vpc.vpc.id}"

  subnet_ids= ["${aws_subnet.public1.id}"]

 ingress {
    rule_no    = 100
    action     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_block     = "0.0.0.0/0"

  }

  egress {
    rule_no    = 100
    action     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_block     = "0.0.0.0/0"

  }


  tags = {
    Name = "${var.public_nacl}"
    
  }
}
resource "aws_network_acl" "private" {
  vpc_id = "${aws_vpc.vpc.id}"

  subnet_ids= ["${aws_subnet.weblayer_private1.id}"]


 ingress {
  
    rule_no    = 100
    action     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_block     = "${var.vpc_cidr}"

  }

  

 egress {
   
    rule_no    = 100
    action     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_block     = "${var.vpc_cidr}"

  }

 tags = {
   Name = "${var.private_nacl}"
   

  }

}


# outputs 

output "public_nacl_id" {
  value = "${aws_network_acl.public.id}"
}

output "private_nacl_id" {
  value = "${aws_network_acl.private.id}"
}
