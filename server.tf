terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "ap-south-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-078efad6f7ec18b8a"
  instance_type = "t2.micro"
  key_name = "pooja-import"

  tags = {
    Name = "Pooja-DevOps-batch-server"
    env = "Production"
    owner = "Pooja H"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

