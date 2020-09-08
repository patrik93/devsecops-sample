
#!/bin/bash
sudo yum -y update

echo "Install Java JDK 8"
sudo yum remove -y java
sudo yum install -y java-1.8.0-openjdk

sudo echo "Install Maven"
sudo yum install -y maven

sudo echo "Install git"
sudo yum install -y git

echo "Install Docker engine"
sudo yum update -y
sudo yum install docker -y
sudo chkconfig docker on

echo "Install Jenkins"
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install jenkins java-1.8.0-openjdk-devel -y
sudo systemctl daemon-reload

sudo usermod -a -G docker jenkins
sudo chkconfig jenkins on
sudo service docker start
sudo service jenkins start
