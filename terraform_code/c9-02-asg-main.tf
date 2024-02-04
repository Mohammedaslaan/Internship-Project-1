resource "aws_autoscaling_group" "terramino" {
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  launch_configuration = aws_launch_configuration.terramino.name
  # launch_template {
  # id      = aws_launch_template.my_launch_template.id
  # version = "$Latest"
  # }
  vpc_zone_identifier = module.vpc.public_subnets
}

