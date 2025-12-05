# Terraform Infrastructure

Infrastructure as Code (IaC) repository for managing cloud infrastructure using Terraform.

## 📁 Repository Structure

```
terraform-infrastructure/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── terraform.tfvars
│   ├── staging/
│   │   └── ...
│   └── prod/
│       └── ...
├── modules/
│   ├── kubernetes/
│   ├── networking/
│   ├── database/
│   └── monitoring/
├── jenkins/
│   └── Jenkinsfile.terraform
└── README.md
```

## 🔄 Pipeline Behavior

The Jenkins pipeline for this repository:
- **Automatically triggers** when any `.tf` files are modified
- **Redeploys the entire infrastructure** when Terraform files change
- Supports multiple environments (dev, staging, prod)
- Implements Terraform best practices (plan → approve → apply)

## 🚀 Environments

| Environment | Purpose | Auto-Deploy |
|-------------|---------|-------------|
| `dev` | Development/testing | Yes |
| `staging` | Pre-production | Yes (with approval) |
| `prod` | Production | Manual approval required |

## 🔐 Required Jenkins Credentials

| ID | Type | Description |
|----|------|-------------|
| `aws-credentials` | AWS Credentials | AWS Access Key + Secret |
| `terraform-state-bucket` | Secret text | S3 bucket for Terraform state |
| `kubeconfig-credential` | Secret file | Kubernetes cluster config |

## 📝 Usage

### Manual Deployment
```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```

### Via Jenkins
1. Push changes to `.tf` files
2. Pipeline auto-triggers
3. Review the plan output
4. Approve (for staging/prod)
5. Apply changes

## 🏗️ Modules

### kubernetes/
Manages Kubernetes cluster configuration:
- Node pools
- Namespaces
- RBAC
- Ingress controllers (Traefik)

### networking/
Network infrastructure:
- VPC/VNet
- Subnets
- Security groups
- Load balancers

### database/
Database resources:
- PostgreSQL instances
- Backup configuration
- Connection secrets

### monitoring/
Observability stack:
- Prometheus
- Grafana
- AlertManager

## 🔗 Related Repositories

- [Helm Charts](https://github.com/Aminamrane/cicd-jenkins-pipelines) - Kubernetes deployments
- [Backend](https://github.com/Aminamrane/fastapi-backend) - FastAPI application
- [Frontend](https://github.com/Aminamrane/react-frontend) - React application


