resource "aws_security_group" "monitoring" {
  name        = "InfraLab-Monitoring-sg"
  description = "Security group for monitoring instance in InfraLab"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name        = "InfraLab-Monitoring-sg"
    Environment = "Lab"
    Project     = "infraLab"
    ManagedBy   = "Terraform"
  }
}

resource "aws_vpc_security_group_egress_rule" "https" {
  security_group_id = aws_security_group.monitoring.id

  description = "Allow outbound HTTPS traffic for aws services"
  ip_protocol = "tcp"
  from_port   = 443
  to_port     = 443
  cidr_ipv4   = "0.0.0.0/0"
}

  