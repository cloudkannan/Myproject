resource "aws_instance" "ec2instance" {
  ami = "${var.base_image_ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${data.terraform_remote_state.foundation.public_subnetid1}"
  security_groups  = ["${data.terraform_remote_state.sg.devops_sg_id}"]
  key_name = "${var.key_name}"

 tags{
     Name = "${var.instance_name}"
    
  }
 

 }


#---- output for Instance id   -------------------------------------

output "ec2_devops_instance_id" {
  value = "${aws_instance.ec2instance.id}"
}

output "ec2_devops_public_ip" {
value = ["${aws_instance.ec2instance.*.public_ip}"]
}












