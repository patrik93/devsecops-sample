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
                    sh 'scp -o StrictHostKeyChecking=no target/java-tomcat-maven-example.war ec2-user@ec2-34-244-169-84.eu-west-1.compute.amazonaws.com:/webapp/apache-tomcat-8.5.57/webapps/webapp.war'
                }
            }
        }

    }
}
