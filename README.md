# 🚀 AWS + Terraform + Go Lambda + DynamoDB + Docker + Kubernetes Project Checklist

## 🔹 Phase 1: Setting Up AWS Infrastructure with Terraform
- [ ] Install Terraform and set up AWS CLI (`aws configure`).
- [ ] Create a new Terraform project (`terraform/` directory).
- [ ] Define the AWS provider in Terraform.
- [ ] Configure Terraform backend (S3 for state storage, DynamoDB for state locking).
- [ ] Create an IAM role for Lambda execution.
- [ ] Define a DynamoDB table to store user data.
- [ ] Create an AWS Lambda function resource in Terraform.
- [ ] Set up an API Gateway to expose the Lambda function.
- [ ] Provision an EKS cluster for Kubernetes deployment.
- [ ] Run `terraform init`, `terraform plan`, and `terraform apply` to deploy the infrastructure.

---

## 🔹 Phase 2: Developing the AWS Lambda Function (Go)
- [ ] Set up a Go project (`go mod init`) for the Lambda function.
- [ ] Install AWS SDK for Go to interact with DynamoDB.
- [ ] Write the Go Lambda function to handle API requests and interact with DynamoDB.
- [ ] Test the function locally using `go run main.go`.
- [ ] Package the function into a zip file for AWS deployment.

---

## 🔹 Phase 3: Containerizing the Lambda Function
- [ ] Write a `Dockerfile` to containerize the Go Lambda function.
- [ ] Set up a `docker-compose.yml` file for local testing.
- [ ] Build and run the container locally using `docker-compose up`.
- [ ] Push the Docker image to a container registry (AWS ECR or Docker Hub).

---

## 🔹 Phase 4: Deploying Lambda to Kubernetes (EKS)
- [ ] Write a Kubernetes deployment manifest to deploy the Lambda function in EKS.
- [ ] Create a Kubernetes service to expose the Lambda function.
- [ ] Deploy the Kubernetes manifests using `kubectl apply`.
- [ ] Verify the deployment by checking logs and testing API calls.

---

## 🔹 Phase 5: Automating Deployment (Optional)
- [ ] Set up a GitHub Actions workflow for automating Terraform deployment.
- [ ] Add a CI/CD pipeline to build and push the Lambda Docker image.
- [ ] Automate Kubernetes deployment using GitHub Actions or Terraform.

---

### 📌 Next Steps
- [ ] Enhance security by using AWS Secrets Manager for environment variables.
- [ ] Optimize the architecture with API Gateway, IAM policies, and monitoring.
- [ ] Scale the Kubernetes deployment with horizontal pod autoscaling.
