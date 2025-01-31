provider "aws" {
  region = "us-east-1"  # Adjust your region
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0c614dee691cbbf37"  # Replace with your preferred AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Avinash"
  }
}
