# =============================================================================
# Development Environment - Main Terraform Configuration
# =============================================================================
# This file defines the infrastructure for the development environment.
# Modify according to your cloud provider and requirements.
# =============================================================================

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    # Adjust providers based on your cloud platform
    # Example for AWS:
    # aws = {
    #   source  = "hashicorp/aws"
    #   version = "~> 5.0"
    # }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.11"
    }
  }

  # Remote state configuration (uncomment and configure)
  # backend "s3" {
  #   bucket         = "your-terraform-state-bucket"
  #   key            = "terraform/dev/terraform.tfstate"
  #   region         = "eu-west-1"
  #   encrypt        = true
  #   dynamodb_table = "terraform-state-lock"
  # }
}

# =============================================================================
# Provider Configuration
# =============================================================================

# Uncomment and configure your cloud provider
# provider "aws" {
#   region = var.aws_region
#   
#   default_tags {
#     tags = {
#       Environment = var.environment
#       ManagedBy   = "Terraform"
#       Project     = var.project_name
#     }
#   }
# }

provider "kubernetes" {
  config_path = var.kubeconfig_path
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

# =============================================================================
# Local Variables
# =============================================================================

locals {
  environment = "dev"
  project     = var.project_name

  common_tags = {
    Environment = local.environment
    Project     = local.project
    ManagedBy   = "Terraform"
  }

  # Kubernetes namespace
  namespace = "app-${local.environment}"
}

# =============================================================================
# Kubernetes Namespace
# =============================================================================

resource "kubernetes_namespace" "app" {
  metadata {
    name = local.namespace

    labels = {
      environment = local.environment
      managed-by  = "terraform"
    }
  }
}

# =============================================================================
# Kubernetes Secrets for Application
# =============================================================================

resource "kubernetes_secret" "db_credentials" {
  metadata {
    name      = "backend-db-credentials"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  data = {
    username = var.db_username
    password = var.db_password
  }

  type = "Opaque"
}

resource "kubernetes_secret" "app_secrets" {
  metadata {
    name      = "app-secrets"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  data = {
    secret-key           = var.app_secret_key
    first-superuser      = var.first_superuser
    first-superuser-pass = var.first_superuser_password
  }

  type = "Opaque"
}

# =============================================================================
# Module Calls (uncomment when modules are implemented)
# =============================================================================

# module "networking" {
#   source = "../../modules/networking"
#   
#   environment = local.environment
#   vpc_cidr    = var.vpc_cidr
#   tags        = local.common_tags
# }

# module "database" {
#   source = "../../modules/database"
#   
#   environment     = local.environment
#   instance_class  = var.db_instance_class
#   db_name         = var.db_name
#   subnet_ids      = module.networking.private_subnet_ids
#   security_groups = [module.networking.db_security_group_id]
#   tags            = local.common_tags
# }

# module "kubernetes" {
#   source = "../../modules/kubernetes"
#   
#   environment = local.environment
#   cluster_name = "${local.project}-${local.environment}"
#   node_count   = var.node_count
#   node_size    = var.node_size
#   tags         = local.common_tags
# }

