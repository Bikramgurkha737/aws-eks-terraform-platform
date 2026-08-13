# 🚀 AWS EKS Terraform Platform

> Production-oriented AWS EKS platform built with Terraform, Kubernetes, Helm, Prometheus/Grafana, Argo CD GitOps, multi-environment infrastructure, secure remote state, and automated GitHub Actions CI/CD validation.

---

## 📌 Overview

This project demonstrates the design and implementation of a modular AWS Kubernetes platform following DevOps and Site Reliability Engineering (SRE) practices.

The platform combines Infrastructure as Code, Kubernetes workload management, Helm packaging, observability, GitOps, security scanning, multi-environment infrastructure, secure Terraform state management, and automated CI/CD validation.

### Current Implementation

- Modular Terraform architecture
- Development, staging, and production environments
- Environment-specific Terraform configuration
- Secure Terraform remote state architecture
- Amazon S3 Terraform state backend
- Native S3 state locking
- Customer-managed AWS KMS encryption for Terraform state
- S3 versioning and public access protection
- Amazon VPC networking
- IAM roles for EKS
- Amazon EKS
- EKS Managed Node Groups
- AWS KMS encryption for EKS secrets
- Kubernetes workloads
- Horizontal Pod Autoscaling
- PodDisruptionBudget
- Kubernetes Ingress
- Reusable Helm chart
- Prometheus monitoring
- Grafana visualization
- Alertmanager
- Prometheus alerting rules
- ServiceMonitor configuration
- Argo CD GitOps
- Environment-specific Helm values
- GitHub Actions CI/CD
- Multi-environment Terraform CI matrix
- Pull Request Terraform validation
- Credential-safe Terraform PR checks
- TFLint
- Trivy IaC security scanning
- Kubeconform schema validation

---

## 🏗 Architecture

![AWS EKS Terraform Platform Architecture](architecture/aws-eks-architecture.png)

### Architecture Flow

```text
GitHub
   │
   ▼
GitHub Actions
   │
   ▼
Terraform
   │
   ├── Dev
   ├── Staging
   └── Production
   │
   ▼
AWS VPC
   │
   ▼
Amazon EKS
   │
   ▼
Managed Node Groups
   │
   ▼
Kubernetes Workloads
   │
   ├── Helm
   ├── Argo CD / GitOps
   └── Prometheus / Grafana
```

The architecture separates infrastructure provisioning, application deployment, GitOps delivery, and observability while providing automated validation through GitHub Actions.

---

## 📂 Repository Structure

```text
aws-eks-terraform-platform/
│
├── .github/
│   └── workflows/
│       ├── terraform-ci.yml
│       ├── terraform-plan-pr.yml
│       ├── kubernetes-ci.yml
│       ├── helm-ci.yml
│       ├── monitoring-ci.yml
│       └── gitops-ci.yml
│
├── architecture/
│   └── aws-eks-architecture.png
│
├── terraform/
│   ├── bootstrap/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── environments/
│   │   ├── dev/
│   │   │   ├── backend.tf
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── providers.tf
│   │   │   └── variables.tf
│   │   │
│   │   ├── staging/
│   │   │   ├── backend.tf
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── providers.tf
│   │   │   └── variables.tf
│   │   │
│   │   └── prod/
│   │       ├── backend.tf
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       ├── providers.tf
│   │       └── variables.tf
│   │
│   └── modules/
│       ├── eks/
│       ├── iam/
│       └── vpc/
│
├── kubernetes/
│   ├── namespace.yaml
│   ├── configmap.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   ├── hpa.yaml
│   └── pdb.yaml
│
├── helm/
│   └── sre-demo/
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
│           ├── configmap.yaml
│           ├── deployment.yaml
│           ├── service.yaml
│           ├── ingress.yaml
│           ├── hpa.yaml
│           └── pdb.yaml
│
├── monitoring/
│   ├── kube-prometheus-stack/
│   │   └── values.yaml
│   ├── rules/
│   │   └── sre-demo-rules.yaml
│   └── servicemonitors/
│       └── sre-demo-servicemonitor.yaml
│
├── gitops/
│   ├── argocd/
│   │   └── sre-demo-application.yaml
│   └── environments/
│       └── dev/
│           └── values.yaml
│
└── README.md
```

---

## 🚀 Platform Capabilities

### Infrastructure

- Infrastructure as Code with Terraform
- Reusable Terraform modules
- Development, staging, and production environments
- Environment-specific configuration
- Environment-specific VPC networking
- Independent Terraform state per environment
- Secure S3 remote state architecture
- Native S3 state locking
- Customer-managed AWS KMS encryption
- S3 state versioning
- S3 Block Public Access
- IAM roles and policy attachments
- Amazon EKS
- EKS Managed Node Groups
- Private EKS API access
- AWS KMS encryption for Kubernetes secrets

### Multi-Environment Architecture

The Terraform platform supports separate development, staging, and production environments while sharing reusable infrastructure modules.

```text
terraform/environments/
├── dev/
├── staging/
└── prod/
```

Each environment provides:

- Independent Terraform state
- Separate EKS cluster naming
- Environment-specific VPC CIDR ranges
- Environment-specific worker-node sizing
- Shared reusable Terraform modules
- Independent validation through the Terraform CI matrix
- Independent Pull Request validation

### Environment Strategy

| Environment | Cluster | VPC CIDR | Node Type |
|-------------|---------|----------|-----------|
| Development | `sre-platform-dev` | `10.0.0.0/16` | `t3.small` |
| Staging | `sre-platform-staging` | `10.1.0.0/16` | `t3.small` |
| Production | `sre-platform-prod` | `10.2.0.0/16` | `t3.medium` |

Production uses larger worker nodes and higher scaling capacity than development and staging.

### Terraform Remote State

The project includes a dedicated bootstrap configuration for secure Terraform remote state management.

Implemented controls include:

- Amazon S3 remote state backend
- Separate state keys for development, staging, and production
- S3 object versioning
- Native Terraform state locking with `use_lockfile`
- Customer-managed AWS KMS encryption
- AWS KMS key rotation
- S3 Block Public Access
- Dedicated bootstrap Terraform configuration

State is logically separated by environment:

```text
eks/dev/terraform.tfstate
eks/staging/terraform.tfstate
eks/prod/terraform.tfstate
```

This prevents development, staging, and production environments from sharing the same Terraform state.

### Kubernetes

- Namespace isolation
- Deployments
- ConfigMaps
- ClusterIP Services
- Ingress
- Horizontal Pod Autoscaling
- PodDisruptionBudget
- Resource requests and limits
- Readiness probes
- Liveness probes

### Helm

- Reusable application Helm chart
- Environment-specific values
- Helm linting
- Template rendering
- Kubernetes schema validation

### Observability

- Prometheus
- Grafana
- Alertmanager
- kube-state-metrics
- Node Exporter
- ServiceMonitor
- PrometheusRule
- Application availability alerts

### GitOps

- Argo CD Application
- Declarative Git-based deployments
- Automated synchronization
- Automatic pruning
- Self-healing
- Environment-specific Helm configuration
- Automatic namespace creation

---

## ⚙️ Technology Stack

| Category | Technology |
|----------|------------|
| Cloud | AWS |
| Infrastructure as Code | Terraform |
| Container Orchestration | Kubernetes / Amazon EKS |
| Package Management | Helm |
| GitOps | Argo CD |
| Monitoring | Prometheus |
| Visualization | Grafana |
| Alerting | Alertmanager |
| CI/CD | GitHub Actions |
| Terraform Linting | TFLint |
| Security Scanning | Trivy |
| Kubernetes Validation | Kubeconform |
| Terraform State | Amazon S3 |
| State Encryption | AWS KMS |
| Version Control | Git / GitHub |
| IDE | Visual Studio Code |

---

## 🔐 Security

The project incorporates multiple infrastructure, Terraform state, CI/CD, and Kubernetes security controls.

- Private EKS API endpoint
- AWS KMS encryption for Kubernetes secrets
- Customer-managed KMS encryption for Terraform state
- KMS key rotation
- S3 Block Public Access
- S3 state versioning
- Native S3 Terraform state locking
- Terraform security scanning with Trivy
- Terraform linting with TFLint
- Kubernetes schema validation
- Resource requests and limits
- CI validation before infrastructure changes are merged
- Credential-safe Pull Request validation
- No permanent AWS credentials required for current PR validation

---

## ✅ CI/CD & Validation

The repository contains automated GitHub Actions workflows covering the complete platform stack.

| Workflow | Purpose |
|----------|---------|
| Terraform CI | Matrix-based Terraform validation for dev, staging, and prod with TFLint and Trivy security scanning |
| Terraform Plan PR | Credential-safe Terraform validation for dev, staging, and prod on Pull Requests |
| Kubernetes CI | Kubernetes manifest validation using Kubeconform |
| Helm CI | Helm linting, template rendering, and schema validation |
| Monitoring CI | Prometheus/Grafana stack rendering and configuration validation |
| GitOps CI | Argo CD and environment-specific Helm configuration validation |

### Terraform CI Matrix

Terraform CI uses a GitHub Actions matrix strategy to validate all three infrastructure environments.

```text
Terraform CI
    │
    ├── Development
    │     ├── Terraform Init
    │     ├── Terraform Format
    │     ├── Terraform Validate
    │     ├── TFLint
    │     └── Trivy
    │
    ├── Staging
    │     ├── Terraform Init
    │     ├── Terraform Format
    │     ├── Terraform Validate
    │     ├── TFLint
    │     └── Trivy
    │
    └── Production
          ├── Terraform Init
          ├── Terraform Format
          ├── Terraform Validate
          ├── TFLint
          └── Trivy
```

The matrix strategy ensures infrastructure changes are validated consistently across development, staging, and production.

---

## 🔀 Pull Request Terraform Validation

Terraform infrastructure changes are validated before they are merged into the `main` branch.

The Pull Request workflow runs independently for all three Terraform environments:

```text
Feature Branch
      │
      ▼
Pull Request
      │
      ▼
Terraform PR Checks
      │
      ├── Development
      ├── Staging
      └── Production
      │
      ▼
Terraform Init
      │
      ▼
Terraform Format Check
      │
      ▼
Terraform Validate
      │
      ▼
PR Checks Pass
      │
      ▼
Merge to Main
```

### PR Validation Strategy

The current Pull Request workflow is designed to perform credential-safe Terraform checks without requiring long-lived AWS credentials.

For each environment, the workflow performs:

- Terraform initialization for validation
- Terraform formatting checks
- Terraform configuration validation
- Independent matrix execution for dev, staging, and prod
- Pull Request status checks before merge

The remote backend configuration is not used for credential-free PR validation because accessing the real S3 backend would require AWS authentication.

This allows structural Terraform validation to run safely on Pull Requests while AWS-backed planning remains a separate future enhancement.

### Current PR Validation Coverage

| Environment | PR Validation |
|-------------|---------------|
| Development | ✅ Enabled |
| Staging | ✅ Enabled |
| Production | ✅ Enabled |

---

## 🔐 Future AWS Authentication Strategy

A future enhancement will use GitHub Actions OpenID Connect (OIDC) to authenticate securely with AWS.

The target authentication architecture is:

```text
GitHub Actions
      │
      │ OIDC
      ▼
AWS IAM
      │
      │ AssumeRole
      ▼
Temporary AWS Credentials
      │
      ▼
Terraform
      │
      ├── Access Remote State
      ├── Query AWS Resources
      └── Generate Terraform Plan
```

Using OIDC will eliminate the need to store long-lived AWS access keys in GitHub.

The future workflow will support:

- GitHub-to-AWS authentication using OIDC
- IAM role assumption
- Short-lived AWS credentials
- Secure access to the S3 Terraform backend
- AWS-backed Terraform Plan
- Terraform Plan review before merge

---

## 🔄 CI Pipeline

```text
Developer
    │
    ▼
Feature Branch
    │
    ▼
Pull Request
    │
    ▼
Terraform PR Validation
    │
    ├── Dev
    ├── Staging
    └── Prod
    │
    ▼
PR Approval / Merge
    │
    ▼
Main Branch
    │
    ▼
GitHub Actions
    │
    ┌───────────────┬───────────────┐
    │               │               │
    ▼               ▼               ▼
Terraform CI   Kubernetes CI      Helm CI
    │               │               │
    ▼               ▼               ▼
 TFLint         Kubeconform      helm lint
 Trivy                           helm template
    │                               │
    └──────────────┬────────────────┘
                   │
            ┌──────┴──────┐
            ▼             ▼
      Monitoring CI    GitOps CI
            │             │
            ▼             ▼
      Prometheus /      Argo CD
         Grafana        Helm Values
```

---

## 🧪 Local Validation

### Terraform

Format all Terraform code:

```bash
terraform fmt -recursive
```

Validate development:

```bash
terraform -chdir=terraform/environments/dev init -backend=false
terraform -chdir=terraform/environments/dev validate
```

Validate staging:

```bash
terraform -chdir=terraform/environments/staging init -backend=false
terraform -chdir=terraform/environments/staging validate
```

Validate production:

```bash
terraform -chdir=terraform/environments/prod init -backend=false
terraform -chdir=terraform/environments/prod validate
```

Validate the remote-state bootstrap configuration:

```bash
terraform -chdir=terraform/bootstrap init
terraform -chdir=terraform/bootstrap validate
```

### Kubernetes

```bash
kubeconform -strict -summary kubernetes/*.yaml
```

Expected result:

```text
Valid: 7
Invalid: 0
Errors: 0
Skipped: 0
```

### Helm

Lint the application chart:

```bash
helm lint helm/sre-demo
```

Render the chart:

```bash
helm template sre-demo helm/sre-demo \
  > /tmp/sre-demo-rendered.yaml
```

Validate rendered resources:

```bash
kubeconform -strict -summary /tmp/sre-demo-rendered.yaml
```

### Monitoring

Add the Prometheus Community repository:

```bash
helm repo add prometheus-community \
  https://prometheus-community.github.io/helm-charts

helm repo update
```

Render the monitoring stack:

```bash
helm template monitoring \
  prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  -f monitoring/kube-prometheus-stack/values.yaml \
  > /tmp/monitoring-rendered.yaml
```

### GitOps

Render the application using the development GitOps values:

```bash
helm template sre-demo helm/sre-demo \
  -f gitops/environments/dev/values.yaml \
  > /tmp/gitops-rendered.yaml
```

Validate:

```bash
kubeconform -strict -summary /tmp/gitops-rendered.yaml
```

---

## 📈 Observability

The project uses `kube-prometheus-stack` to provide Kubernetes monitoring and observability.

### Monitoring Flow

```text
Kubernetes Workloads
        │
        ▼
  ServiceMonitor
        │
        ▼
    Prometheus
        │
   ┌────┴────┐
   ▼         ▼
Grafana   Alertmanager
             │
             ▼
       PrometheusRule
```

Prometheus collects Kubernetes and application metrics, Grafana provides visualization, and Alertmanager provides the foundation for operational alerting.

---

## 🔄 GitOps Deployment

Argo CD provides the GitOps deployment layer.

```text
GitHub Repository
       │
       ▼
     Argo CD
       │
       ▼
Environment Values
       │
       ▼
   Helm Chart
       │
       ▼
 Kubernetes / EKS
```

The Argo CD configuration enables:

- Automated synchronization
- Self-healing
- Automatic pruning
- Environment-specific configuration
- Declarative Kubernetes deployments

---

## 🗺 Roadmap

### Phase 1 — Infrastructure ✅

- [x] Modular Terraform
- [x] Environment structure
- [x] AWS VPC
- [x] IAM
- [x] Amazon EKS
- [x] Managed Node Groups
- [x] KMS encryption

### Phase 2 — CI & Security ✅

- [x] GitHub Actions
- [x] Terraform validation
- [x] TFLint
- [x] Trivy security scanning

### Phase 3 — Kubernetes & Helm ✅

- [x] Kubernetes workloads
- [x] Horizontal Pod Autoscaling
- [x] PodDisruptionBudget
- [x] Ingress
- [x] Helm chart
- [x] Kubernetes CI
- [x] Helm CI

### Phase 4 — Observability ✅

- [x] Prometheus
- [x] Grafana
- [x] Alertmanager
- [x] ServiceMonitor
- [x] PrometheusRule
- [x] Monitoring CI

### Phase 5 — GitOps ✅

- [x] Argo CD
- [x] GitOps environment configuration
- [x] Automated synchronization
- [x] Self-healing
- [x] GitOps CI

### Phase 6 — Multi-Environment & Terraform State ✅

- [x] Development environment
- [x] Staging environment
- [x] Production environment
- [x] Multi-environment Terraform CI matrix
- [x] Amazon S3 remote state architecture
- [x] Separate state per environment
- [x] Native S3 state locking
- [x] S3 state versioning
- [x] Customer-managed KMS state encryption
- [x] KMS key rotation
- [x] S3 Block Public Access
- [x] Terraform backend bootstrap configuration

### Phase 7 — Pull Request Automation ✅

- [x] Terraform Pull Request workflow
- [x] Development PR validation
- [x] Staging PR validation
- [x] Production PR validation
- [x] Multi-environment PR matrix
- [x] Terraform initialization for PR validation
- [x] Terraform format checks
- [x] Terraform configuration validation
- [x] Credential-safe Pull Request checks
- [x] PR checks before merge

### Phase 8 — AWS Authentication & Terraform Plan 🚧

- [ ] GitHub Actions OIDC integration
- [ ] AWS IAM role for GitHub Actions
- [ ] Short-lived AWS credentials
- [ ] Secure remote-state access from CI
- [ ] AWS-backed Terraform Plan on Pull Requests
- [ ] Terraform Plan output review before merge

### Phase 9 — Platform Enhancements 🚧

- [ ] AWS Load Balancer Controller
- [ ] ExternalDNS
- [ ] External Secrets Operator
- [ ] Loki centralized logging
- [ ] OpenTelemetry
- [ ] Custom Grafana dashboards
- [ ] Alertmanager notification integrations
- [ ] Automated Terraform Apply with approval controls

---

## 🎯 Project Goals

This project is designed to demonstrate practical DevOps and Site Reliability Engineering capabilities across infrastructure provisioning, Kubernetes operations, CI/CD automation, observability, security, and GitOps.

Key engineering goals include:

- Build reusable Infrastructure as Code
- Maintain isolated development, staging, and production environments
- Validate infrastructure changes automatically
- Detect configuration and security issues early
- Validate Pull Requests before merge
- Avoid long-lived cloud credentials in CI/CD
- Use GitOps principles for Kubernetes deployments
- Implement Kubernetes observability
- Secure Terraform state
- Build toward production-style automated infrastructure delivery

---

## 👨‍💻 Author

**Bikram Thapa**

Site Reliability Engineer | DevOps Engineer

GitHub:  
https://github.com/Bikramgurkha737