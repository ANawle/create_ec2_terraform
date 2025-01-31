provider "aws" {
  region = "ap-south-1"  # Adjust your region
}

resource "aws_key_pair" "my_key" {
  key_name   = "avi-key"
  public_key = file("C:/Users/js/.ssh/id_rsa.pub")
}


resource "aws_instance" "my_instance" {
  ami           = "ami-00bb6a80f01f03502"  # Replace with your preferred AMI
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name  # Attach the key pair

  tags = {
    Name = "Avinash"
  }
}
