
aws_region  = "us-east-1"

vpc_name  = "vpc_devops"
enable_dns_hostnames = "true"
enable_dns_support = "true"

key_name = "kp_devops"
igw_name = "igw_devops"
public_subnet_name= "sub_public_devops"

# subnets
private_web_subnet_name = "sub_webprivate_devops"
private_app_subnet_name = "sub_appprivate_devops"
private_db_subnet_name = "sub_dbprivate_devops"

# route table

public_route    = "public_route_devops-rt"
privte_route    = "private_route_devops-rt"

# NACL

public_nacl ="public_nacl_devops"
private_nacl ="private_nacl_devops"

vpc_cidr = "10.0.0.0/16"                          #  ip ranges: 10.0.0.1 - 10.0.255.254   total ips : 65534    Broadcast ip : 10.0.255.255

#----------------public subnets-----------------------------
subnet_public1_cidr = "10.0.0.0/24"               #  ip ranges: 10.0.0.1 - 10.0.0.254    total ips :  254      Broadcast ip : 10.0.0.255



#----------------web layer -----------------------------
subnet_web_private1_cidr = "10.0.2.0/24"         #  ip ranges: 10.0.1.1 - 10.0.1.254    total ips :  254      Broadcast ip : 10.0.1.255


#---------------app layer -----------------------------
subnet_appserver_private1_cidr = "10.0.3.0/24"   #  ip ranges: 10.0.3.1 - 10.0.3.254    total ips :  254      Broadcast ip : 10.0.3.255


#---------------db layer -----------------------------
subnet_dbserver_private1_cidr = "10.0.4.0/24"    #  ip ranges:  10.0.4.1 - 10.0.4.254   total ips :  254      Broadcast ip : 10.0.4.255


#  Remaining all ip are reserved        



   










