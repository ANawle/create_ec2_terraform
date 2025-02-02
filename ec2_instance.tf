# Provider Configuration
provider "aws" {
  region = "ap-south-1"  # Replace with your region
}

# S3 Bucket Resource
resource "aws_s3_bucket" "my_bucket" {
  bucket = "avibkt"  # Make sure this name is globally unique
  

  # Tags for the bucket
  tags = {
    Name        = "MyS3Bucket"
    Environment = "dev"
  }
}
