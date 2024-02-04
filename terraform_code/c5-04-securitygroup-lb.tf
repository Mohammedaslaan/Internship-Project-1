module "loadbalancer_sg" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "5.1.0"
  name        = "public-instance-sg"
  description = "Security group for load balancer to allow traffic at port 80"
  vpc_id      = module.vpc.vpc_id

  tags = local.common_tags
  # Ingress Rules and Cidr Blocks
  ingress_rules       = ["http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # Engress Rule open all
  egress_rules = ["all-all"]
}