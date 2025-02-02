provider "aws" {
  region = "ap-south-1"  # Adjust your region
}

resource "aws_instance" "my_instance" {
  ami           = "ami-00bb6a80f01f03502"  # Replace with your preferred AMI
  instance_type = "t2.micro"

  key_name      = "Spacelift_key"  # Use your existing key pair name here 

  tags = {
    Name = "Avinash"
  }
}
