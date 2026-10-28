resource "aws_instance" "monitoring" {
  ami           = var.ami_id
  instance_type = var.instance_type

  metadata_options {
    http_tokens = "required"
  }

  credit_specification {
    cpu_credits = "standard"
  }


  tags = {
    Name        = "InfraLab-Monitoring"
    Environment = "Lab"
    Project     = "infraLab"
    ManagedBy   = "Terraform"
  }
}