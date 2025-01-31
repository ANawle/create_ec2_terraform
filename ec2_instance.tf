  provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA6ODU37ZLXUF2YMDN"
  secret_key = "WEqmYaJb/kab0EZfYwJqE+xspFau+XK0s7IteZQ6"
}

resource "aws_instance" "my_instance1" {
  ami           = "ami-00bb6a80f01f03502"  # Replace with your preferred AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Avi_instance"
  }
}
