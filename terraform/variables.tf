variable "region" {
  default = "eu-west-1"
}
variable "environment" {
  default = "Dev"
}

variable "keyname" {
  default = "devsecops-key"
}

variable "tmp-key" {
  default = "tmp_key"
}
variable "ami-amazon" {
  default = "ami-08a2aed6e0a6f9c7d"
  description = "AMI ID for Amazon Linux 2 in Ireland region"
}
variable "public-subnet" {
  default = "subnet-ef566ea7"
  description = "ID of public subnet"
}