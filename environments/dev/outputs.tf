# =============================================================================
# Development Environment - Outputs
# =============================================================================

output "environment" {
  description = "Environment name"
  value       = local.environment
}

output "namespace" {
  description = "Kubernetes namespace for the application"
  value       = kubernetes_namespace.app.metadata[0].name
}

output "db_credentials_secret" {
  description = "Name of the Kubernetes secret containing database credentials"
  value       = kubernetes_secret.db_credentials.metadata[0].name
}

output "app_secrets_name" {
  description = "Name of the Kubernetes secret containing application secrets"
  value       = kubernetes_secret.app_secrets.metadata[0].name
}

# Uncomment when modules are implemented
# output "cluster_endpoint" {
#   description = "Kubernetes cluster endpoint"
#   value       = module.kubernetes.cluster_endpoint
# }

# output "database_endpoint" {
#   description = "Database endpoint"
#   value       = module.database.endpoint
#   sensitive   = true
# }

# output "load_balancer_ip" {
#   description = "Load balancer public IP"
#   value       = module.networking.load_balancer_ip
# }


