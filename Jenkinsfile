pipeline {
    agent any

    environment {
        // Increase the HEARTBEAT_CHECK_INTERVAL for durable-task plugin
        JAVA_OPTS = "-Dorg.jenkinsci.plugins.durabletask.BourneShellScript.HEARTBEAT_CHECK_INTERVAL=86400"
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git url: 'https://github.com/kienfru/Ansible-jenkins-CICD.git', branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                    terraform init
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Run terraform plan with nohup and tail to ensure continuous output
                    sh '''
                        nohup terraform plan > plan.log 2>&1 &
                        tail -f plan.log
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Do you want to apply the changes?', ok: 'Apply'
                sh 'terraform apply -auto-approve'
            }
        }

        stage('Terraform Destroy') {
            steps {
                input message: 'Do you want to destroy the infrastructure?', ok: 'Destroy'
                sh 'terraform destroy -auto-approve'
            }
        }
    }

    post {
        always {
            // Archive the Terraform plan log for troubleshooting
            archiveArtifacts artifacts: 'plan.log', allowEmptyArchive: true
        }
        cleanup {
            // Clean up the workspace
            cleanWs()
        }
    }
}
