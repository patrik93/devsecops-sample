resource "aws_instance" "jenkins-instance" {
  ami = var.ami-amazon
  instance_type = "t2.micro"
  #key_name = var.keyname
  key_name = var.tmp-key
  subnet_id = var.public-subnet
  vpc_security_group_ids = ["sg-064e815cb0507f634"]
  user_data = file("install_jenkins.sh")

  associate_public_ip_address = true
  tags = {
    Name = "Jenkins-instance"
  }
}

resource "aws_instance" "tomcat-instance" {
  ami = var.ami-amazon
  instance_type = "t2.micro"
  #key_name = var.keyname
  key_name = var.tmp-key
  subnet_id = var.public-subnet
  vpc_security_group_ids = ["sg-064e815cb0507f634"]
  user_data = file("install_tomcat.sh")

  associate_public_ip_address = true
  tags = {
    Name = "Tomcat-instance"
  }
}

resource "aws_instance" "sonar-instance" {
  ami = var.ami-amazon
  instance_type = "t2.medium" #Costs $0.05 per Hour in eu-west-1
  #key_name = var.keyname
  key_name = var.tmp-key
  subnet_id = var.public-subnet
  vpc_security_group_ids = ["sg-064e815cb0507f634"]
  user_data = file("install_sonar.sh")

  associate_public_ip_address = true
  tags = {
    Name = "Sonar-instance"
  }
}



output "Jenkins-instance" {
  value = aws_instance.jenkins-instance.public_dns
}
output "Tomcat-instance" {
  value = aws_instance.tomcat-instance.public_dns
}
output "Sonar-instance" {
  value = aws_instance.sonar-instance.public_dns
}

