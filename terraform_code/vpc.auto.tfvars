cidr_block         = "10.0.0.0/16"
vpc_name           = "myvpc"
availability_zones = ["ap-south-1a", "ap-south-1b"]

public_subnet_cidrs          = ["10.0.101.0/24", "10.0.102.0/24"]
enable_database_subnet_group = true
enable_database_subnet_RT    = true
