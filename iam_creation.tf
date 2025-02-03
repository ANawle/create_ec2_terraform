# Specify the AWS provider and region
provider "aws" {
  region = "ap-south-1"  # Change as needed
}

# Create an IAM user
resource "aws_iam_user" "spacelift_user" {
  name = "spacelift-user"
  path = "/"
}

# (Optional) Attach a policy to the user. For example, allow read-only access.
resource "aws_iam_user_policy" "spacelift_user_policy" {
  name   = "spacelift-user-readonly"
  user   = aws_iam_user.spacelift_user.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:Get*",
          "s3:List*"
        ]
        Resource = "*"
      }
    ]
  })
}

# Create an access key for the IAM user
resource "aws_iam_access_key" "spacelift_user_key" {
  user = aws_iam_user.spacelift_user.name
}

# Outputs for the created IAM user and access key credentials
output "iam_user_name" {
  description = "The IAM user name"
  value       = aws_iam_user.spacelift_user.name
}

output "access_key_id" {
  description = "Access key ID for the IAM user"
  value       = aws_iam_access_key.spacelift_user_key.id
}

output "secret_access_key" {
  description = "Secret access key for the IAM user (sensitive)"
  value       = aws_iam_access_key.spacelift_user_key.secret
  sensitive   = true
}
