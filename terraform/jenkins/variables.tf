
variable "aws_region" {
    description = "Ths AWS region to the things in."
    default = "ap-south-1"
}

variable "key_name" {
  description = "SSH key to connect to EC2 instance"
  default = "EC2 Tutorial"
}

variable "instance_type" {
 description = "instance type for ec2"
 default = "t2.micro" 
}

variable "security_group" {
 description = "Name of security group"
 default = "jenkins-security-group"
}

variable "tag_name" {
 description = "Tag name of EC2 instance"
 default = "development"
}

variable "ami_id" {
 description = "value"
  default = "ami-052cef05d01020f1d"
}