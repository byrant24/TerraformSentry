# AWS Region
variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "ap-south-1"
}

# Instance Details
variable "instance_type" {
  description = "instance type"
  default = "m4.2xlarge"
}

variable "ami" {
  description = "Ubuntu ami"
  default = "ami-XXXXXXXXXXXX"
}

variable "key_pair" {
  description = "prod key pair"
  default = "key-pair-name"
}

# VPC Details
variable "vpc_id" {
  description = "VPC standard"
  default = "vpc-5468c53d"
}

variable "subnet_id" {
  default = "subnet-XXXXXX"
  description = "public 1a"
}

# Security Groups
variable "sg1" {
  description = "sg 1"
  default = "sg-XXXXXXXXXX"
}

# Security Groups
variable "sg2" {
  description = "sg 2"
  default = "sg-XXXXXXXX"
}