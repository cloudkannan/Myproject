
variable "aws_region" {}
variable "igw_name" {}
variable "key_name" {}
variable "vpc_name" {}
variable "public_subnet_name" {}						
variable "private_web_subnet_name" {}
variable "private_app_subnet_name" {}
variable "private_db_subnet_name" {}


variable "enable_dns_hostnames" {
  description = "should be true if you want to use private DNS within the VPC"
  default     = "false"
}

variable "enable_dns_support" {
  description = "should be true if you want to use private DNS within the VPC"
  default     = "false"
}

# route table

variable "public_route" {}
variable  "privte_route" {}

# nacl 
variable "private_nacl" {}
variable "public_nacl" {}



#VPC
variable "vpc_cidr" {}

#----------------public subnets-----------------------------
variable "subnet_public1_cidr" {}

#----------------web layer subnet-----------------------------
variable "subnet_web_private1_cidr" {}

#----------------app layer subnet-----------------------------
variable "subnet_appserver_private1_cidr" {}

#----------------db layer subnet-----------------------------
variable "subnet_dbserver_private1_cidr" {}



