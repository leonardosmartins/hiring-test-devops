#--------------------------------------------------------------
# AWS Settings
#--------------------------------------------------------------
# variable "aws_access_key" {
# }

# variable "aws_secret_key" {
# }

variable "aws_region" {
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-2"
}

#--------------------------------------------------------------
# General
#--------------------------------------------------------------
variable "name" {
  description = "The name used."
}

variable "account_id" {
  
}


