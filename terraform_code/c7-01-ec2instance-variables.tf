variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_keypair" {
  description = "aws ec2 key pair that need to be associated with ec2."
  type        = string
  default     = "InstanceForAMI"
}

variable "private_instance_count" {
  description = "aws ec2 private instances count"
  type        = number
  default     = 1
}