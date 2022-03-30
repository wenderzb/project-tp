pipeline{
    agent any
    environment {
        PROJECT     = credentials('project')
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
                sh 'az login -u w.batista@globant.com -p $PROJECT'
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
