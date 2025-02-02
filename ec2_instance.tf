# Provider Configuration
provider "aws" {
  region = "ap-south-1"  # Replace with your region
}

# RDS Instance Configuration
resource "aws_db_instance" "my_rds_instance" {
  # Basic Configuration
  identifier        = "my-rds-instance"
  engine            = "mysql"  # You can change this to "postgres", "oracle", etc.
  instance_class    = "db.t2.micro"  # Adjust the instance type as needed
  allocated_storage = 20  # Adjust storage size in GB

  # Database Credentials
  username = "admin_user"  # The master username for the DB
  password = "Avinash"  # The master password for the DB
  skip_final_snapshot = true  # Set to false if you want to create a final snapshot before deletion

  # Backup and Maintenance Settings
  backup_retention_period = 7  # Number of days to retain backups
  maintenance_window = "Sun:23:45-Sun:23:59"  # Time window for maintenance (fixed format)

  # Networking
  multi_az               = false  # Set to true for multi-AZ deployment
  publicly_accessible    = true  # Set to true if you want the DB to be publicly accessible
  vpc_security_group_ids = ["sg-0d17589a56d653439"]  # Use the security group ID for your VPC

  # Storage and Performance
  storage_type         = "gp2"  # General Purpose SSD storage
  max_allocated_storage = 100  # Maximum allocated storage for scaling

  # Tags (Optional)
  tags = {
    Name        = "MyRDSInstance"
    Environment = "dev"
  }

  # Optional: Enable monitoring
  monitoring_interval = 60  # Enable enhanced monitoring with a 60-second interval

  # Optional: Enable automatic minor version upgrades
  auto_minor_version_upgrade = true
}

# Output RDS Endpoint (for connecting to the database)
output "rds_endpoint" {
  value = aws_db_instance.my_rds_instance.endpoint
}
