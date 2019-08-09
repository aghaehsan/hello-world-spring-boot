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
		withAWS(credentials: 'cicd', region: 'us-east-1') {
    			sh 'aws iam get-user'
		}
        }
    }
}
