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
}