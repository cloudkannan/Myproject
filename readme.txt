Problem - 1
===============
Terraform pre-request
======================

The below steps must necessary for environment setup.  

$ yum update -y
$ yum install -y wget
$ wget https://bootstrap.pypa.io/get-pip.py
$ python /tmp/get-pip.py
$ pip install awscli


We can execute Terraform code 2 ways

1.Create Role ( testRole ) then attach to Terraform instance 

  Ex: testRole have enough permission to create AWS resources. ( attach policy to  testRole ) 
  
2.Configure AWS CLI

  Create testUser ( programmatic user )  then assign policy.

Based on testUser credential   ( access key , secret key ), we can able execute terrafrom codes.


Terraform configuration
========================


sudo yum install -y unzip 


wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip

unzip terraform_0.11.14_linux_amd64.zip
 
sudo mv terraform /usr/local/bin/

Confirm terraform binary is accessible: terraform --version


===================================================================================
AWS Console 

1. create S3 bucket for the below name.
   Name : govt-terraform-state

2. Create key pair 
   Name : kp_devops

===================================================================================
Divided into 3 modules

Root Module ( Singapore )   --refer image ( problem1_structure.jpeg) 

1.Foundation ( vpc,subnet,routable, igw, natgateway, nacl )
2.deploy     ( instances )
3.security   ( security groups) 

Note: Storing state file in s3 bucket.
      if you define as single module , it is tight coupling.
=================================================================================
Execute the module for the below order

$ foundation module 
$ securitygroup module 
$ instance module 	  
	  












