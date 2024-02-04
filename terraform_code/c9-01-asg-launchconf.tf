resource "aws_launch_configuration" "terramino" {
  name_prefix                 = "learn-terraform-aws-asg-"
  image_id                    = data.aws_ami.amzlinux2.id
  instance_type               = "t2.micro"
  security_groups             = [module.public_sg.security_group_id]
  associate_public_ip_address = true
  key_name                    = var.instance_keypair
  #user_data = filebase64("${path.module}/app2-simpleapp.sh")
  user_data            = templatefile("${path.module}/ap.tmpl", { HOST = aws_db_instance.default.address })
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [aws_db_instance.default, null_resource.generate_env_file]

}
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.EC2-S3Role.name
}

