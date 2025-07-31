# SUSaaS - Secure URL Shortener as a Service

This project is a multi-cloud deployable secure URL shortener backend demonstrating end-to-end DevSecOps practices:

- Python FastAPI backend
- Containerized with Docker
- CI/CD pipeline on GitHub Actions with linting, static analysis, dependency scanning, container scanning, and dynamic scanning
- Security tools: bandit, snyk, trivy, OWASP ZAP

## Setup Instructions

### Prerequisites
- Python 3.10+
- Docker Desktop
- Git
- GitHub account
- Snyk account and API token

### Running Locally

1. Clone repo
2. Navigate to backend folder
3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
4. Run FastAPI server:
   ```bash
   uvicorn main:app --reload
   ```
5. Open http://localhost:8000/docs to test API

### Docker Build & Run

```bash
docker build -t susaas-backend ./backend
docker run -p 8000:8000 susaas-backend
```

### GitHub Actions CI Pipeline

- Runs on push/PR to main branch
- Runs lint, bandit static scan, snyk dependency scan
- Builds Docker image and scans with Trivy
- Runs OWASP ZAP baseline dynamic scan against running container

### Adding Snyk Token to GitHub Secrets

- Go to your repo > Settings > Secrets and Variables > Actions
- Add `SNYK_TOKEN` with your Snyk API token

## Next Steps

- Add Infrastructure as Code (Terraform) for AWS, Azure, and GCP deployment
- Add secrets management integration
- Extend CI/CD for multi-cloud deployment

---
Created by ChatGPT
