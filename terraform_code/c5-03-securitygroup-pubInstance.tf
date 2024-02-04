module "public_sg" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "5.1.0"
  name        = "ec2_eg2"
  description = "Security group for public subet basition host ssh port open for everybody (IPV4 cidr), egress ports are all world open"
  vpc_id      = module.vpc.vpc_id

  tags = local.common_tags
  # Ingress Rules and Cidr Blocks
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "http-8080-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # Engress Rule open all
  egress_rules = ["all-all"]

}

