# =============================================================================
# Staging Environment - Main Terraform Configuration
# =============================================================================
# Staging environment - similar to production but with reduced resources
# =============================================================================

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.11"
    }
  }

  # backend "s3" {
  #   bucket         = "your-terraform-state-bucket"
  #   key            = "terraform/staging/terraform.tfstate"
  #   region         = "eu-west-1"
  #   encrypt        = true
  #   dynamodb_table = "terraform-state-lock"
  # }
}

provider "kubernetes" {
  config_path = var.kubeconfig_path
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

locals {
  environment = "staging"
  project     = var.project_name
  namespace   = "app-${local.environment}"
}

resource "kubernetes_namespace" "app" {
  metadata {
    name = local.namespace
    labels = {
      environment = local.environment
      managed-by  = "terraform"
    }
  }
}

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


