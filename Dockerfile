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
            }

        }
        stage('test'){
            steps{
                sh 'mvn test'
            }

        }

        stage ('upload war to S3'){
            steps {
                withAWS(credentials: 'cicd', region: 'us-east-1') {       
                    s3Upload(bucket:"ehsan-bucket", workingDir:'target', includePathPattern:'*.jar');
                }
            }
        }
        // stage('build ami with packer'){
        //     steps{
        //         //required Pipeline: AWS Steps Jenkins Plugin
        //         withAWS(credentials: 'cicd', region: 'us-east-1') {                   
        //              sh 'packer build -var uuid=${RUN_ID} createImage.json'
        //         }
        //     }

        // }

        // stage('provision machines'){
        //     steps{
        //         //required Pipeline: AWS Steps Jenkins Plugin
        //         withAWS(credentials: 'cicd', region: 'us-east-1') {    
        //             sh 'terraform init'               
        //              sh 'terraform apply -var uuid=${RUN_ID} -auto-approve'
        //         }
        //     }

        // }

       
    }
}
