resource "aws_instance" "monitoring" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [aws_security_group.monitoring.id]

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