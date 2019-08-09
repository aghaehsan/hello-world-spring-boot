pipeline {
    environment {
	SUITE_RUN_ID = UUID.randomUUID().toString()
    }
    agent {
        label 'docker-node'
    }
    stages {
        stage('build'){
            steps{
                sh "printenv | sort"
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
                //required Pipeline: AWS Steps Jenkins Plugin
                withAWS(credentials: 'cicd', region: 'us-east-1') {    
                    dir('machineImages') {
                         sh 'pwd'
                    }                 
                     sh 'packer build ./createImage.json'
                }
            }

        }
    }
}
