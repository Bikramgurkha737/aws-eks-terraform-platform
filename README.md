# 🚀 AWS EKS Terraform Platform

> Production-oriented AWS EKS platform built with Terraform, Kubernetes, Helm, Prometheus/Grafana, Argo CD GitOps, and automated GitHub Actions CI/CD validation.

---

## 📌 Overview

This project demonstrates the design and implementation of a modular AWS Kubernetes platform following DevOps and Site Reliability Engineering (SRE) practices.

The platform combines Infrastructure as Code, Kubernetes workload management, Helm packaging, observability, GitOps, security scanning, and automated CI validation.

### Current Implementation

- Modular Terraform architecture
- Environment-specific Terraform configuration
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
│       ├── kubernetes-ci.yml
│       ├── helm-ci.yml
│       ├── monitoring-ci.yml
│       └── gitops-ci.yml
│
├── architecture/
│   └── aws-eks-architecture.png
│
├── terraform/
│   ├── environments/
│   │   └── dev/
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
- Environment-specific configuration
- AWS VPC networking
- IAM roles and policy attachments
- Amazon EKS
- EKS Managed Node Groups
- Private EKS API access
- AWS KMS encryption for Kubernetes secrets

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
| Version Control | Git / GitHub |
| IDE | Visual Studio Code |

---

## 🔐 Security

The project incorporates multiple infrastructure and Kubernetes security controls.

- Private EKS API endpoint
- AWS KMS encryption for Kubernetes secrets
- Terraform security scanning with Trivy
- Terraform linting with TFLint
- Kubernetes schema validation
- Resource requests and limits
- CI validation before infrastructure changes are merged

---

## ✅ CI/CD & Validation

The repository contains automated GitHub Actions workflows covering the complete platform stack.

| Workflow | Purpose |
|----------|---------|
| Terraform CI | Terraform formatting, validation, TFLint and Trivy security scanning |
| Kubernetes CI | Kubernetes manifest validation using Kubeconform |
| Helm CI | Helm linting, template rendering and schema validation |
| Monitoring CI | Prometheus/Grafana stack rendering and configuration validation |
| GitOps CI | Argo CD and environment-specific Helm configuration validation |

### CI Pipeline

```text
Developer Push / Pull Request
              │
              ▼
           GitHub
              │
     ┌────────┼─────────┐
     │        │         │
     ▼        ▼         ▼
 Terraform Kubernetes  Helm
    CI        CI        CI
     │        │         │
     ▼        ▼         ▼
  TFLint  Kubeconform helm lint
  Trivy               helm template
     │                  │
     └────────┬─────────┘
              │
       ┌──────┴──────┐
       ▼             ▼
 Monitoring CI    GitOps CI
       │             │
       ▼             ▼
 Prometheus/      Argo CD
 Grafana          Helm Values
```

---

## 🧪 Local Validation

### Terraform

Format Terraform:

```bash
terraform fmt -recursive
```

Validate the development environment:

```bash
terraform -chdir=terraform/environments/dev init -backend=false
terraform -chdir=terraform/environments/dev validate
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

### Phase 6 — Future Enhancements 🚧

- [ ] Remote Terraform state with S3
- [ ] DynamoDB state locking / appropriate Terraform state locking
- [ ] Staging environment
- [ ] Production environment
- [ ] AWS Load Balancer Controller
- [ ] ExternalDNS
- [ ] External Secrets Operator
- [ ] Loki centralized logging
- [ ] OpenTelemetry
- [ ] Custom Grafana dashboards
- [ ] Alertmanager notification integrations
- [ ] Terraform Plan on Pull Requests

---

## 👨‍💻 Author

**Bikram Thapa**

Site Reliability Engineer | DevOps Engineer

GitHub:  
https://github.com/Bikramgurkha737