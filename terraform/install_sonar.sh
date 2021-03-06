
#!/bin/bash
echo "install docker engine"
sudo yum update -y
sudo yum install docker -y
sudo usermod -a -g docker ec2-user
chkconfig docker on
service docker start

docker run -d --name sonarqube -p 9000:9000 docker.io/library/sonarqube:7.9-community
docker pull owasp/dependency-check

