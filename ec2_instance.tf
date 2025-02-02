# Provider Configuration
provider "aws" {
  region = "ap-south-1"  # Replace with your region
}

# S3 Bucket Resource
resource "aws_s3_bucket" "my_bucket" {
  bucket = "avibkt"  # Make sure this name is globally unique
  acl    = "public-read"  # Adjust ACL as needed (private, public-read, etc.)

  # Optional: Enable versioning
  versioning {
    enabled = true
  }

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
