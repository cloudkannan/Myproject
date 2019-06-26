
 #security group - web server
 
 resource "aws_security_group" "web" {
  name        = "${var.name}"
  description = "Security group for web server"
  vpc_id      = "${data.terraform_remote_state.foundation.vpc_id}"
  tags {
    Name = "${var.name}"
  }
}



#-------- string with web server rules ------------------


resource "aws_security_group_rule" "public_allow_ingress_ssh" {

  # HTTP access from anywhere
      type="ingress"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks =["0.0.0.0/0"]
      security_group_id = "${aws_security_group.web.id}"

  }
resource "aws_security_group_rule" "public_allow_ingress_http" {

  # HTTP access from anywhere
      type="ingress"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks =["0.0.0.0/0"]
      security_group_id = "${aws_security_group.web.id}"

  }

 
resource "aws_security_group_rule" "allow_egress_alltraffi" {
    type="egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks =["0.0.0.0/0"]
    security_group_id="${aws_security_group.web.id}"
  }



#-------- Ending with web server rules ------------------


output "devops_sg_id" {
  value = "${aws_security_group.web.id}"
}













