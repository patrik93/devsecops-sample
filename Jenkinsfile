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
        stage('Build'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('Deploy to tomcat isntance'){
            steps{
                sshagent(['tomcat']){
                    sh 'scp -o StrictHostKeyChecking=no target/java-tomcat-maven-example.war ec2-user@ec2-63-35-172-11.eu-west-1.compute.amazonaws.com:/webapp/apache-tomcat-8.5.57/webapps/webapp.war'
                }
            }
        }

    }
}