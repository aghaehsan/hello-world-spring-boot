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
        
       
    }
}
