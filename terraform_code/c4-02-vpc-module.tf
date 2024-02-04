# create vpc terraform module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.4.0"

  # VPC basic details
  name           = "${local.name}-${var.vpc_name}"
  cidr           = var.cidr_block
  azs            = var.availability_zones
  public_subnets = var.public_subnet_cidrs
  # database subnets
  create_database_subnet_group       = var.enable_database_subnet_group
  create_database_subnet_route_table = var.enable_database_subnet_RT
  #create_database_nat_gateway_route      = true
  #create_database_internet_gateway_route = true
  database_subnets = var.db_subnet_cidrs

  # Vpc DNS parameters.
  enable_dns_hostnames = true
  enable_dns_support   = true

  # add tags for subnet
  public_subnet_tags = {
    Type = "public-subnets"
  }
  database_subnet_tags = {
    Type = "database-subnets"
  }
  tags     = local.common_tags
  vpc_tags = local.common_tags
}