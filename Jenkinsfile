pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Mahmut0123/Devops_Proje.git'
            }
        }
        stage('Check for changes') {
            steps {
                script {
                    def changes = sh(script: 'git diff --name-only HEAD~1 HEAD', returnStdout: true).trim()
                    if (changes.contains('./iller/Dockerfile')) {
                        env.CHANGES = "true"
                    } else {
                        env.CHANGES = "false"
                    }
                }
            }
        }
        stage('Update remote file') {
            when {
                expression { env.CHANGES == "true" }
            }
            steps {
                sh '''
                ssh 192.168.88.7@finartz "
                cd /home/finartz/proje-1/
                git pull origin master
                "
                '''
            }
        }
        stage("Restart application") {
            when {
                expression { env.CHANGES == "true" }
            }
            steps {
                sh '''
                ssh 192.168.88.7@finartz "
                cd /home/finartz/proje-1/Devops_Proje/iller
                docker build -t iller .
                docker rm -f iller
                docker run -d --name iller --network proje_staj -p 4444:4444 iller
                "
                '''
            }
        }
    }
}
