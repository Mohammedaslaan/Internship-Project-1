# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resource to be created"
  type        = string
  default     = "ap-south-1"
}

# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "dev"
}

# Business Divison 
variable "intern" {
  description = "Who will use this infra"
  type        = string
  default     = "intern"
}