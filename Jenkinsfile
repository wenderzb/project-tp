pipeline{
    agent any
    environment {
        SECRET_EMAIL     = credentials('secret_email')
        SECRET_PASSWORD     = credentials('secret_password')
    }
    stages{
        stage('Build Terraform'){
            steps{
                sh 'terraform init -reconfigure'
                echo 'Done Build'
            }
        }
        stage('Az login'){
            steps{
                sh 'az login -u $SECRET_EMAIL -p $SECRET_PASSWORD'
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
