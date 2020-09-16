
#!/bin/bash
echo "Install Docker engine"
sudo yum update -y
sudo yum install docker -y
sudo chkconfig docker on
sudo service docker start

sudo docker run -d --name sonarqube -p 9000:9000 docker.io/library/sonarqube:7.9-community


