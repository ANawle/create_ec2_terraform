provider "aws" {
  region = "ap-south-1"  # Adjust your region
}

resource "aws_instance" "my_instance" {
  ami           = "ami-00bb6a80f01f03502"  # Replace with your preferred AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Avi"
  }

  lifecycle {
    create_before_destroy = true
  }

  # Provisioner to stop the instance after creation
  provisioner "local-exec" {
    command = "aws ec2 stop-instances --instance-ids ${self.id} --region ap-south-1"
  }
}
