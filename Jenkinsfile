pipeline {
    agent {
        label 'docker-node'
    }
    stages {
        stage('build'){
            steps{
                'sh' mvn compile 
            }

        }
    }
}
