pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/Josemyr1993/jenkins_argo_cd_harbor_docker_kubernetes.git'
                sh 'docker build -t library/harbor_cicd_v2 .'

            }

        }
        stage('Push to Harbor') {
            environment {
                DOCKER_CREDENTIALS = credentials('Harbor')
            }
            steps {
                script {
                    // Login to Harbor using credentials
                    sh "docker login -u ${DOCKER_CREDENTIALS_USR} -p ${DOCKER_CREDENTIALS_PSW} 192.168.8.135"

                    // Tag the image
                    sh 'docker tag library/harbor_cicd_v2 192.168.8.135/library/harbor_cicd:v${BUILD_NUMBER}'
                    
                    // Push the image to Harbor
                    sh 'docker push 192.168.8.135/library/harbor_cicd:v${BUILD_NUMBER}'
                }
            }
        }
        stage('Trigger GitHub Push') {
            steps {
                build job: 'push_image_tag_git', wait: true, parameters: [string(name: 'Build_Number_Image', value: "${BUILD_NUMBER}")]
            }
        }

    }
}
