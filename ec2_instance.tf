provider "aws" {
  region = "ap-south-1"  # Adjust your region
}

# Define the Security Group with SSH (22) and HTTP (80) rules
resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "Allow SSH and HTTP access"

  # Inbound rules for SSH and HTTP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from any IP address
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from any IP address
  }

  # Outbound rule allowing all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All traffic
    cidr_blocks = ["0.0.0.0/0"]  # Allow outbound traffic to any destination
  }
}

# Create the EC2 instance with the Security Group
resource "aws_instance" "my_instance" {
  ami           = "ami-00bb6a80f01f03502"  # Replace with your preferred AMI
  instance_type = "t2.micro"
  key_name      = "Spacelift_key"  # Use your existing key pair name here
  security_groups = [aws_security_group.my_security_group.name]  # Associate the security group

  tags = {
    Name = "Avinash"
  }

  lifecycle {
    create_before_destroy = true
  }
}

