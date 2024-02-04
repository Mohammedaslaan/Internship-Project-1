# CIDR Block
variable "cidr_block" {
  description = "cidr block range which constitute the vpc"
  type        = string
  default     = "10.0.0.0/16"
}
# vpc name
variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "myvpc"
}
variable "availability_zones" {
  description = "AZs where infra will provision"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}
variable "public_subnet_cidrs" {
  description = "No. of public subnet with their cidr values"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}
variable "db_subnet_cidrs" {
  description = "No. of db subnet with their cidr values"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "enable_database_subnet_group" {
  description = "Allows creation of private subnet for database."
  type        = bool
  default     = true
}
variable "enable_database_subnet_RT" {
  description = "Allows creation of private subnet RT for database."
  type        = bool
  default     = true
}
