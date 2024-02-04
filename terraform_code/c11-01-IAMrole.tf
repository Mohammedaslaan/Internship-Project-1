# # IAM Policy for full access to S3
# resource "aws_iam_policy" "s3_full_access_policy" {
#   name        = "s3_full_access_policy"
#   description = "Policy for full access to S3"

#   policy = <<-EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": "s3:*",
#       "Resource": "*"
#     }
#   ]
# }
# EOF
# }

# # IAM Role for EC2 instances with the attached S3 access policy
# resource "aws_iam_role" "ec2-asg-role" {
#   name = "ec2-asg-role"

#   assume_role_policy = <<-EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# EOF
# }

# # Attach the S3 access policy to the IAM Role
# resource "aws_iam_role_policy_attachment" "s3_access_attachment" {
#   policy_arn = aws_iam_policy.s3_full_access_policy.arn
#   role       = aws_iam_role.ec2-asg-role.name
# }

# Create an IAM Role for S3 Access.

resource "aws_iam_role" "EC2-S3Role" {
  name = "EC2-S3Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Create an S3 access policy to the above role.

resource "aws_iam_policy" "WebAppS3" {
  name        = "WebAppS3"
  description = "Policy for accessing S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Effect   = "Allow"
        Resource = ["*"]
      }
    ]
  })
}

# Attach the policy to the created role.

resource "aws_iam_role_policy_attachment" "s3_access_role_attachment" {
  policy_arn = aws_iam_policy.WebAppS3.arn
  role       = aws_iam_role.EC2-S3Role.name
}