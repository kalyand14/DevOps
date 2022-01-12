# DevOps - Playground for DevOps Task

## Deploy Jenkins and configure it

### Deploy Jenkins

- [X] Deploy jenkins in EC2 using CloudFromation
- [ ] Deploy jenkins in EC2 using Terraform 

### Create Jenkins Piepline

#### Simple Pipeline: Validation -> Checkout -> Build -> Deploy

#### Full blown Pipeline: Validation -> Checkout -> Build --> Unit Test --> Code Quality -> Upload Artifact -> Deploy to Dev -> Slack Notification --> Approval for QA Deploy --> Deploy to QA --> Approval for Prod Deploy --> Deploy to Prod

#### Deploy WEB application

- [ ] Build and Deploy Java Application (Maven and Gradle)
- [ ] Build and Deploy Angular Application 
- [ ] Build and Deploy Python Application

#### Deploy Microservice application

- [ ] Build and Deploy SPringBoot Microservice Application into Kubernetes Cluster
- [ ] Build and Deploy NodeJS Microservice Application into Kubernetes Cluster

#### Deploy Mobile application

- [ ] Build Android application and deploy artificat into Nexus
- [ ] Build iOS application and deploy artificat into Nexus

### Configure Jenkins

- [ ] Update the required plugin (Maven, Gradle)
- [ ] Configure with master and slave nodes


## AWS

### How to install AWS CLI in Mac

Step1: curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"

Step2: sudo installer -pkg AWSCLIV2.pkg -target /

Step3: which aws

Step4: aws configure
