
# Thoughtworks MediaWiki Deployment

## Description
This project aims to deploy a MediaWiki application using Kubernetes on AWS EKS. It utilizes Terraform for Infrastructure as Code (IaC) to provision the Kubernetes cluster on AWS, Helm for managing Kubernetes applications, and Jenkins for Continuous Integration/Continuous Deployment (CI/CD) pipeline automation.

## Components
1. **Jenkins**: Configured as the CI/CD master for automation of build, test, and deployment processes.
2. **Terraform**: Used for provisioning the Kubernetes cluster on AWS EKS (Elastic Kubernetes Service).
3. **Helm**: Employed for deploying and managing the MediaWiki application on the Kubernetes cluster.

## Deployment Steps
1. **Clone Repository**: Clone the repository containing the Helm chart and deployment files.
2. **Terraform Init**: Initialize Terraform to set up the environment.
3. **Terraform Plan**: Generate an execution plan for the Terraform deployment.
4. **Terraform Apply**: Apply the Terraform plan to provision the Kubernetes cluster on AWS EKS.
5. **Build Docker Image**: Build the Docker image for the MediaWiki application.
6. **Tag Docker Image**: Tag the Docker image with appropriate repository and version.
7. **Push Docker Image to Docker Hub**: Push the Docker image to the Docker Hub registry for access.
8. **Deploy with Helm**: Deploy the MediaWiki application using Helm on the AWS EKS Kubernetes cluster.

## CI/CD Pipeline
1. **Continuous Integration (CI)**: Jenkins is configured to trigger builds on code changes, run tests, and generate artifacts.
2. **Continuous Deployment (CD)**: Automated deployment of the MediaWiki application to the Kubernetes cluster using Helm after successful CI builds.

## Folder Structure
Thoughtworks-MediaWiki/
├── helm-chart/
│ ├── Chart.yaml
│ ├── values.yaml
│ └── templates/
│ ├── deployment.yaml
│ └── service.yaml
├── Dockerfile
├── jenkinsfile
├── main.tf
└── README.md


## Getting Started
1. Clone the repository: `git clone https://github.com/javeed1111/Thoughtworks-MediaWiki.git`
2. Navigate to the cloned directory: `cd Thoughtworks-MediaWiki`
3. Follow the deployment steps mentioned above to provision the infrastructure and deploy the application.

## Notes
- Ensure proper AWS credentials are configured for Terraform.
- Helm should be installed and configured to work with the Kubernetes cluster.
- Verify security group settings to allow traffic on port 80 for the Load Balancer.
- Make necessary adjustments to the Helm deployment files for rolling updates and other strategies as required.
- For any issues or inquiries, contact javeed mdjaveed16896@gmail.com.

## Project Logo

![Project Logo](https://github.com/javeed1111/Thoughtworks-MediaWiki/blob/main/task/app1.png)

## Deployment Architecture

![Deployment Architecture](https://github.com/javeed1111/Thoughtworks-MediaWiki/blob/main/task/jnk1.png)

## Docker image

![Docker image ](https://github.com/javeed1111/Thoughtworks-MediaWiki/blob/main/task/do1.png)

## Deployment on EKS

![Image 1](https://github.com/javeed1111/Thoughtworks-MediaWiki/blob/main/task/p1.png)

![Image 2](https://github.com/javeed1111/Thoughtworks-MediaWiki/blob/main/task/p2.png)

![Image 3](https://github.com/javeed1111/Thoughtworks-MediaWiki/blob/main/task/p3.png)


## Accessing the Application

The application can be accessed using the following URLs:

- **Direct IP Access**: [http://3.82.188.49/mw-config/index.php](http://3.82.188.49/mw-config/index.php)

- **Load Balancer URL**: [a1be91954f25b4398a0e481bd2d24bc2-402578010.us-east-1.elb.amazonaws.com](http://a1be91954f25b4398a0e481bd2d24bc2-402578010.us-east-1.elb.amazonaws.com)


Please note that access to the application will be available until the end of the day.

