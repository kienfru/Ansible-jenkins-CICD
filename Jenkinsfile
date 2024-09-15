pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                git branch: 'main', url: 'https://github.com/kienfru/Ansible-jenkins-CICD.git'
            }
        } 
        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                // Generate and show Terraform execution plan
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                // Apply the Terraform plan to create/update infrastructure
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Sleep 5mins') {
            steps {
                // Pause the pipeline for 10 minutes
                sleep time: 5, unit: 'MINUTES'
            }
        }
        stage('Terraform Destroy') {
            steps {
                // Destroy the Terraform-managed infrastructure
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
