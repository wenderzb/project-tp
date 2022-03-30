pipeline{
    agent any
    stages{
        stage('Build Terraform'){
            steps{
                sh 'terraform init -reconfigure'
                echo 'Done Build'
            }
        }
        stage('Install Az'){
            steps{
                sh 'curl -sL [https://aka.ms/InstallAzureCLIDeb](https://aka.ms/InstallAzureCLIDeb) | sudo bash'
                echo 'Install az'
            }
        }
        stage('Az login'){
            steps{
                sh 'az login'
                echo 'AZ login'
            }
        }
        stage('Test terraform'){
            steps{
                sh 'terraform plan'
                echo 'Done plan'
            }
        }
        stage('Deploy Terraform') {
            steps{
                sh 'terraform apply -auto-approve'
                echo 'Done apply'
            }
        }
    }
}
