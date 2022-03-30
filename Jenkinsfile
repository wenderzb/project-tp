pipeline{
    agent any
    stages{
        stage('Build Terraform'){
            steps{
                sh 'terraform init -reconfigure'
                echo 'Done Build'
            }
        }
        stage('AZ login'){
            steps{
                withCredentials([string(credentialsId: 'jenkins-azure-p', variable: 'jenkins-azure-p')]) {
                    sh 'az login -u w.batista@globant.com -p ${jenkins-azure-p}'
                }
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
