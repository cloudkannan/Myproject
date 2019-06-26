provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket = "govt-terraform-state"
    key    = "dev/deploy/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

data "terraform_remote_state" "foundation" {
  backend = "s3"
  config {
    bucket = "govt-terraform-state"
    key    = "dev/foundation/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

data "terraform_remote_state" "sg" {
  backend = "s3"
  config {
    bucket = "govt-terraform-state"
    key    = "dev/securitygroup/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
