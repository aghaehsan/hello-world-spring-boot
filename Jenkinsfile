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
                //required Pipeline: AWS Steps Jenkins Plugin
                withAWS(credentials: 'cicd', region: 'us-east-1') {                     
                     sh 'packer build -var script_A=machineImages/installCodeDeploy -var script_B=machineImages/installTomcat machineImages/createImage.json'
                }
            }

        }
    }
}
