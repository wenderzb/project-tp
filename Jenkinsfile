pipeline{
    agent any
    environment {
       SECRET_EMAIL     = credentials('jenkins-azure-e')
       SECRET_PASSWORD     = credentials('jenkins-azure-p')
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
                sh 'az login -u ${SECRET_EMAIL} -p ${SECRET_PASSWORD}'
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
