variable "instance_type" {
  description = "EC2 instance type used for monitoring lab"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID used for ec2 monitoring instance"
  type        = string
}