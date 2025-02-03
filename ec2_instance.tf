provider "aws" {
  region = "ap-south-1"  # Change to your preferred AWS region
}

resource "aws_db_instance" "my_rds" {
  allocated_storage    = 20
  engine              = "mysql"
  engine_version      = "8.0.40"
  instance_class      = "db.t3.micro"
  identifier         = "my-simple-rds1"
  username           = "admin"    # Change to your desired username
  password           = "Avinashnawle"  # Change to a secure password
  publicly_accessible = true
  skip_final_snapshot = true
}

output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.my_rds.endpoint
}
