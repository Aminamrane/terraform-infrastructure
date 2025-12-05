# Terraform Infrastructure

Infrastructure as Code repository.

## Structure

```
terraform-infrastructure/
├── environments/
│   ├── dev/
│   ├── staging/
│   └── prod/
├── modules/
└── jenkins/
    └── Jenkinsfile.terraform
```

## CI/CD

Pipeline located in: `cicd-jenkins-pipelines/jenkins/Jenkinsfile.terraform`

Pipeline stages:
1. Checkout code
2. Terraform plan
3. Approval (for production)
4. Terraform apply
5. Trigger Helm deployment

## Usage

The pipeline triggers automatically when .tf files are modified.

Actions available:
- plan: Preview changes
- apply: Apply changes
- destroy: Remove resources
