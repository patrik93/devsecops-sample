
#!/bin/bash
sudo yum update
sudo yum install java-1.8.0-openjdk.x86_64 -y
sudo mkdir /webapp
sudo chown -R ec2-user: /webapp
cd /webapp
wget http://xenia.sote.hu/ftp/mirrors/www.apache.org/tomcat/tomcat-8/v8.5.57/bin/apache-tomcat-8.5.57.zip
unzip apache-tomcat-8.5.57.zip
chmod +x apache-tomcat-8.5.57/bin/catalina.sh

sh /webapp/apache-tomcat-8.5.57/bin/startup.sh
