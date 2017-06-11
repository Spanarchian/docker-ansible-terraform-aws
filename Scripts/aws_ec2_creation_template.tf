provider "aws" {
  region     = "ap-south-1"
}


resource "aws_instance" "example" {
  ami           = "ami-cdbdd7a2"
  instance_type = "t2.micro"
  key_name = "demo"
  security_groups = ["wz-1"]
}

resource "aws_instance" "example2" {
  ami           = "ami-cdbdd7a2"
  instance_type = "t2.micro"
  key_name = "demo"
  security_groups = ["wz-1"]
}


resource "aws_instance" "example3" {
  ami           = "ami-cdbdd7a2"
  instance_type = "t2.micro"
  key_name = "demo"
  security_groups = ["wz-1"]
}

