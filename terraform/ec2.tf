resource "aws_instance" "jenkins-instance" {
  ami = var.ami-amazon
  instance_type = "t2.micro"
  key_name = var.keyname

  subnet_id = var.public-subnet
  vpc_security_group_ids = ["sg-064e815cb0507f634"]
  user_data = file("install_jenkins.sh")

  associate_public_ip_address = true
  tags = {
    Name = "Jenkins-instance"
  }
}
