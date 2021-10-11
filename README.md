# AMP Portal DevOps Challenge

## Description
This project creates an entire CI/CD pipeline for a simple React application resulting in a running instance on AWS.  To simplify setup and administration, it makes use of the AWS default VPC and the Fargate compute engine. The project is composed of two related but decoupled tasks: 
1. Build Container Image From Application Source Code
1. Deploy Image on AWS.


### Build Container Image From Application Source Code

A GitHub action has been created that, upon code checkin, will do the following:
1. Build the React application
1. Test the build
1. Validate the Dockerfile
1. Containerize the application using Docker as the container type
1. Push the container to an AWS ECR (Elastic Container Registry) repository


### Deploy Image On AWS 
Terraform will be used to:
1. Connect to AWS
1. Create an ECS cluster using Fargate
1. Define and apply security and access roles
1. Make use of Default VPC with three load-balanced subnets
1. Pull image created from ECR repository
1. Run Fargate service

## Requirements
In order to build this project, the following are required:
1. An AWS account with **aws cli** installed locally
1. Terraform installed
1. A GitHub account

## How To Use
### Upload Source Code To GitHub
1. Unzip archive, creating two directories: **devops-challenge** and **devops-challenge-deploy**
1. Commit **devops-challenge** to a new repo on GitHub
1. On the newly created repo, under **settings->secrets** create two GitHub secrets from your AWS security credentials:
   * AWS_ACCESS_KEY_ID
   * AWS_SECRET_ACCESS_KEY
1. Create a **private** ECR repoitory at AWS 
1. Update the ENV variables **ECR_REGISTRY** and **ECR_REPOSITORY** in the **main.yml** file under **.github/workflows/**

### Deploy to AWS
To deploy the created Docker image on AWS, do the following:
1. cd to directory **devops-challenge-deploy**
1. In **variables.tf** change the **default** value of **aws_ecr_repo_name** to reflect the repository you've created
1. In **variables.tf** change the **default** value of **aws_region** to reflect the default region associated with your AWS account
1. Initialize project: `terraform init`
1. Validate syntax: `terraform validate`
1. View Terraform plan: `terraform plan`
1. Apply script: `terraform apply`

### Confirm
You should now see the script running on the public IP address assigned by AWS:
1. Log in to your AWS account
1. Navigate to **EC2 -> Load Balancers** 
1. In the description of **devops-challenge-lb-tf** you will find the external IP address
1. Copy and past the URL into a browser, appending the port number **:3000** 

# Helpful Links
Setting up an AWS account: https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/

Ssetting up a GitHub account: https://docs.github.com/en/get-started/signing-up-for-github/signing-up-for-a-new-github-account

Downloading Terraform: https://www.terraform.io/downloads.html

Installing AWS Command Line Interface (CLI): https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html

Understanding GitHub encrypted Secrets: https://docs.github.com/en/actions/security-guides/encrypted-secrets