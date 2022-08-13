terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.26.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
locals {
  mytag = "r-by-terraform"
}

resource "aws_instance" "tf-instance" {
  instance_type = var.ec2-type
  ami           = var.ec2-ami
  key_name      = var.ec2-key
  tags = {
    name = "${local.mytag}-came"
  }
}

resource "aws_s3_bucket" "tf-s3" {
  bucket        = "${local.mytag}-${count.index}"
  force_destroy = true
  count         = var.num-of-bucket != 0 ? var.num-of-bucket : 2
}

resource "aws_iam_user" "tf-user" {
  for_each = toset(var.users)
  name = each.value
}

output "public-ip" {
  value = aws_instance.tf-instance.public_ip
}

output "s3" {
  value = aws_s3_bucket.tf-s3[*]
}

output "names" {
  value = [for i in var.users : upper(i) if length(i) > 6 ]
}