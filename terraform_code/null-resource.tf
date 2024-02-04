output "rds_host" {
  value = aws_db_instance.default.address
}

# Generate the env_variables.sh file after obtaining RDS details
resource "null_resource" "generate_env_file" {
  provisioner "local-exec" {
    command = <<EOT
echo "export HOST=${aws_db_instance.default.address}" > env_variables.sh
EOT
  }
  # Run the provisioner when RDS details are available
  depends_on = [aws_db_instance.default]
}