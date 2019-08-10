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

       stage('upload to S3') {
            steps {
                withAWS(credentials: 'cicd', region: 'us-east-1') {
                    sh 'echo "hello KB">hello.txt'
                    s3Upload acl: 'Private', bucket: 'ehsanz-bucket', file: 'hello.txt'
                    s3Download bucket: 'ehsanz-bucket', file: 'downloadedHello.html', path: 'hello.html'
                    sh 'cat downloadedHello.html'
                }
            }
        }
        
       
    }
}
