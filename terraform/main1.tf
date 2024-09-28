provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "geistuiNadaHefnawy" {
  bucket = "nadahefnawy-geistui-bucket"
#  lifecycle {
#    prevent_destroy = true  # Prevents the bucket from being destroyed
#  }
}

resource "aws_route53_zone" "geist_ui" {
  name = "geist-ui.nadahefnawy.site"
#  lifecycle {
#    prevent_destroy = true  # Prevents the bucket from being destroyed
#  }
}

#resource "aws_instance" "RHEL8" {
#  ami           = "ami-08900fdabfe86d539" # Replace with the correct AMI ID
#  instance_type = "m5.large"
#  key_name      = "keypair1"
#  security_groups = ["node"]
#  lifecycle {
#    prevent_destroy = true  # Prevents the bucket from being destroyed
#  }

#  tags = {
#    Name = "RHEL8"
#  }
#}

resource "aws_instance" "kops" {
  ami           = "ami-0e86e20dae9224db8" # Replace with the correct AMI ID
  instance_type = "t2.micro"
  key_name      = "keypair1"
  security_groups = ["kops"]

  iam_instance_profile = "kopsadmin"

  tags = {
    Name = "kops"
  }
 # lifecycle {
 #   prevent_destroy = true  # Prevents the bucket from being destroyed
 # }
}