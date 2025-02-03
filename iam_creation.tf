# Provider Configuration
provider "aws" {
  region = "ap-south-1"  # Replace with your region
}
	
# S3 Bucket Resource with force_destroy enabled for deletion
resource "aws_s3_bucket" "my_bucket" {
  bucket         = "avibkt3"  # Make sure this name is globally unique
  force_destroy  = true      # Allows deletion even if the bucket contains objects

  # Tags for the bucket
  tags = {
    Name        = "MyS3Bucket"
    Environment = "dev"
  }
}
