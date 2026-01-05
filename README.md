# AegisOps AI — Production-Grade DevOps & Platform Engineering Project

AegisOps AI is a real-world, production-grade DevOps project that demonstrates how to design, deploy, secure, observe, and operate a modern microservices platform on AWS using Kubernetes, GitOps, CI/CD, and GenAI-powered AIOps.

This project is designed from a **Senior DevOps / SRE perspective**, focusing on reliability, security, automation, and operational excellence.

---

## 🚀 Business Use Case

AegisOps AI simulates a SaaS platform with:
- A core business microservice (`order-service`)
- An internal GenAI-powered AIOps service for incident analysis and runbook generation

The platform demonstrates how startups and enterprises can:
- Operate Kubernetes securely in AWS
- Automate deployments with CI/CD & GitOps
- Implement observability and self-healing
- Use GenAI for operational intelligence

---

## 🧱 High-Level Architecture

```text
Internet
   ↓
GitHub Actions (CI)
   ↓
Amazon ECR
   ↓
ArgoCD (GitOps)
   ↓
Amazon EKS (Private Nodes)
   ↓
Microservices (Helm-based)
   ↓
Prometheus / Grafana / Alertmanager

