variable "aws_access_key" {
  type = string
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  type = string
  description = "AWS Secret Key"
}

variable "aws_region" {
  type = string
  description = "AWS region"
}

variable "app_name" {
  type = string
  description = "Application Name"
}

variable "app_environment" {
  type = string
  description = "Application Environment"
}

variable "cidr" {
  type = string
  description ="The CIDR block for the VPC"
  default = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "List of private subnets"
}

variable "public_subnets" {
  description = "List of public subnets"
}

variable "availability_zones" {
  description = "List of availabitly zones"
}

variable "aws_cloudwatch_retention_in_days" {
  type = number
  description = "AWS cloudwatch logs retention in Days"
  default = 1
}