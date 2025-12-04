# =============================================================================
# Development Environment - Variable Definitions
# =============================================================================

# -----------------------------------------------------------------------------
# General Variables
# -----------------------------------------------------------------------------

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "fastapi-app"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "eu-west-1"
}

# -----------------------------------------------------------------------------
# Kubernetes Variables
# -----------------------------------------------------------------------------

variable "kubeconfig_path" {
  description = "Path to kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

variable "node_count" {
  description = "Number of Kubernetes worker nodes"
  type        = number
  default     = 2
}

variable "node_size" {
  description = "Size of Kubernetes worker nodes"
  type        = string
  default     = "t3.medium"
}

# -----------------------------------------------------------------------------
# Database Variables
# -----------------------------------------------------------------------------

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

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "app"
}

variable "db_instance_class" {
  description = "Database instance class"
  type        = string
  default     = "db.t3.micro"
}

# -----------------------------------------------------------------------------
# Application Secrets
# -----------------------------------------------------------------------------

variable "app_secret_key" {
  description = "Application secret key for JWT"
  type        = string
  sensitive   = true
}

variable "first_superuser" {
  description = "First superuser email"
  type        = string
  default     = "admin@example.com"
}

variable "first_superuser_password" {
  description = "First superuser password"
  type        = string
  sensitive   = true
}

# -----------------------------------------------------------------------------
# Networking Variables
# -----------------------------------------------------------------------------

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "domain" {
  description = "Domain name for the application"
  type        = string
  default     = "dev.example.com"
}

