# Provider Configuration
provider "aws" {
  region = "ap-south-1"  # Replace with your region
}

# S3 Bucket Resource
resource "aws_s3_bucket" "my_bucket" {
  bucket = "avibkt"  # Make sure this name is globally unique
  aws_s3_bucket_acl = "public-read"  # Adjust ACL as needed (private, public-read, etc.)

  # Tags for the bucket
  tags = {
    Name        = "MyS3Bucket"
    Environment = "dev"
  }
}

# Optional: Output the bucket name
output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
