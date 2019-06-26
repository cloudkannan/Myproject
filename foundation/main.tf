provider "aws" {
   region = "ap-southeast-1"
}

terraform {
  backend "s3" {
     bucket = "govt-terraform-state"
     key    = "dev/foundation/terraform.tfstate"
     region = "ap-southeast-1"
     skip_region_validation = true
  }
}

