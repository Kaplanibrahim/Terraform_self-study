terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "tf-remote-s3"
    key            = "env/dev/tf-remote-backend.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-s3-app-lock"
    encrypt        = true
  }
}


data "aws_ami" "dat-ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*"]
  }
}



resource "aws_instance" "tf-ec2" {
  ami           = data.aws_ami.dat-ami.id
  key_name      = "ibrahim" #private key 
  instance_type = "t2.micro"
  tags = {
    name = "instance-for-backend"
  }
}

output "private_ip" {
  value = aws_instance.tf-ec2.private_ip
}