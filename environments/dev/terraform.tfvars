# =============================================================================
# Development Environment - Variable Values
# =============================================================================
# IMPORTANT: Do NOT commit sensitive values to version control!
# Use environment variables or a secrets manager for sensitive data.
# =============================================================================

# General
project_name = "fastapi-app"
environment  = "dev"
aws_region   = "eu-west-1"

# Kubernetes
kubeconfig_path = "~/.kube/config"
node_count      = 2
node_size       = "t3.medium"

# Database (use environment variables for sensitive values)
# db_username = ""  # Set via TF_VAR_db_username
# db_password = ""  # Set via TF_VAR_db_password
db_name           = "app_dev"
db_instance_class = "db.t3.micro"

# Application
# app_secret_key           = ""  # Set via TF_VAR_app_secret_key
first_superuser = "admin@dev.example.com"
# first_superuser_password = ""  # Set via TF_VAR_first_superuser_password

# Networking
vpc_cidr = "10.0.0.0/16"
domain   = "dev.example.com"

