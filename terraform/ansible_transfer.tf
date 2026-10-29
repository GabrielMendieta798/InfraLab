resource "aws_s3_bucket" "ansible_transfer" {
  bucket_prefix = "infralab-ssm-transfer-"
  force_destroy = true

  tags = {
    Name        = "InfraLab-Ansible-Transfer"
    Environment = "Lab"
    Project     = "InfraLab"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_public_access_block" "ansible_transfer" {
  bucket = aws_s3_bucket.ansible_transfer.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}