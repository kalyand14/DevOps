provider "aws" {
 region = var.aws_region
}

#Create security group with firewall rules
resource "aws_security_group" "security_jenkins_grp" {
  name        = var.security_group
  description = "security group for jenkins"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = var.security_group
  }
}

resource "aws_instance" "JenkinsServer" {
  ami           = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  security_groups= [var.security_group]
  user_data = file("install_jenkins.sh")
  tags= {
    Name = var.tag_name
  }
}

# Create Elastic IP address
resource "aws_eip" "JenkinsServer" {
  vpc      = true
  instance = aws_instance.JenkinsServer.id
tags= {
    Name = "jenkins_elastic_ip"
  }
}