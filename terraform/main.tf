provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "geistuiNadaHefnawy" {
  bucket = "nadahefnawy-geistui-bucket"
  lifecycle {
    prevent_destroy = true  # Prevents the bucket from being destroyed
  }
}

resource "aws_route53_zone" "geist_ui" {
  name = "geist-ui.nadahefnawy.site"
  lifecycle {
    prevent_destroy = true  # Prevents the bucket from being destroyed
  }
}

resource "aws_instance" "RHEL8" {
  ami           = "ami-08900fdabfe86d539" 
  instance_type = "m5.large"
  key_name      = "keypair1"
  security_groups = ["node"]

  tags = {
    Name = "RHEL8"
  }
}



# Create IAM Role with name KopsAdmin
resource "aws_iam_role" "kops_admin_role" {
  name               = "KopsAdmin"  
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"  
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach AdministratorAccess policy to the KopsAdmin role
resource "aws_iam_role_policy_attachment" "admin_access" {
  role       = aws_iam_role.kops_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Create an instance profile for the KopsAdmin role
resource "aws_iam_instance_profile" "kops_instance_profile" {
  name = "kops-instance-profile"  # The instance profile name
  role = aws_iam_role.kops_admin_role.name
}


# Launch an EC2 instance with the instance profile attached and name it "kops"
resource "aws_instance" "kops" {
  ami           = "ami-0e86e20dae9224db8"  
  instance_type = "t2.micro"
  key_name      = "keypair1"  
  security_groups = ["kops"]  

  iam_instance_profile = aws_iam_instance_profile.kops_instance_profile.name  
  tags = {
    Name = "kops"
  }
  lifecycle {
    prevent_destroy = true  # Prevents the bucket from being destroyed
  }
}
