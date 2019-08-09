pipeline {
    agent {
        label 'docker-node'
    }
    stages {
        stage('build'){
            steps{
                sh 'mvn compile package'
            }

        }
        stage('test'){
            steps{
                sh 'mvn test'
            }

        }
        stage('build ami with packer'){
            steps{
                withCredentials ([
                    usernamePassword(credentialsId: 'cicd', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY')
                ])
                sh 'packer -build -var aws_access_key=${ACCESS_KEY} -VAR aws_secret_key=${AWS_SECRET} machineImages/createImage.json'
            }

        }
    }
}
