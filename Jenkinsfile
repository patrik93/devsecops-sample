pipeline{
    agent any

    stages {
        stage('Initialize'){
            steps{
                sh '''
                    echo "Init phase"
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                    '''
            }
        }
        stage('Sonarqube test'){
            steps{
                withSonarQubeEnv('sonar'){
                    sh 'mvn sonar:sonar'
                    sh 'cat target/sonar/report-task.txt'
                }
            }
        }
        
        stage('Build'){
            steps{
                sh 'mvn clean package'
            }
        }


        stage('Deploy to tomcat isntance'){
            steps{
                sshagent(['ec2-user']){
                    sh 'scp -o StrictHostKeyChecking=no target/java-tomcat-maven-example.war ec2-user@ec2-63-33-191-164.eu-west-1.compute.amazonaws.com:/webapp/apache-tomcat-8.5.57/webapps/webapp.war'
                }
            }
        }
         stage('DAST'){
             steps{
                sshagent(['ec2-user']){
                    sh 'ssh -o StrictHostKeyChecking=no ec2-user@ec2-3-249-153-237.eu-west-1.compute.amazonaws.com "docker run -t owasp/dependency-check zap-baseline.py -t http://ec2-63-33-191-164.eu-west-1.compute.amazonaws.com:8080/webapp"'
                }

             }
         }

    }
}
