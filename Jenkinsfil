pipeline {
    agent any

    environment {
        TERRAFORM_VERSION = '1.0.11'
    }

    stages {
        stage('Install Terraform') {
            steps {
                script {
                    def terraformExists = sh(script: 'terraform --version', returnStatus: true) == 0
                    if (!terraformExists) {
                        sh """
                        wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
                        unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
                        sudo mv terraform /usr/local/bin/
                        """
                    }
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('git') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('git') {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('git') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            cleanWs()
        }
    }
}
