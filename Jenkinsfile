pipeline {
    environment {
        RUN_ID = UUID.randomUUID().toString()
    }
    agent {
        label 'docker-node'
    }
    stages {
        stage('build'){
            steps{
                sh 'mvn compile package'
                //stash includes: 'target/*.war', name: 'builtSources'
            }

        }
        stage('test'){
            steps{
                sh 'mvn test'
            }

        }

        stage('build ami with packer'){
            steps{
                //unstash 'builtSources'
                //required Pipeline: AWS Steps Jenkins Plugin
                withAWS(credentials: 'cicd', region: 'us-east-1') {                   
                     sh 'packer build -var uuid=${RUN_ID} createImage.json'
                }
            }

        }

        stage('provision infrastructure'){
            steps{
                //required Pipeline: AWS Steps Jenkins Plugin
                withAWS(credentials: 'cicd', region: 'us-east-1') {    
                    sh 'terraform init'               
                     sh 'terraform apply -var uuid=${RUN_ID} -auto-approve'
                }
            }

        }

       
    }
}
