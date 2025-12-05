# Staging Environment Variables
# Inherits structure from dev, adjust values in terraform.tfvars

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "fastapi-app"
}

variable "kubeconfig_path" {
  description = "Path to kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

variable "db_username" {
  description = "Database username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}


