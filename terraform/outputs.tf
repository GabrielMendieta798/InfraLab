output "ansible_ssm_bucket_name" {
  description = "Temporary S3 bucket used by Ansible SSM"
  value       = aws_s3_bucket.ansible_transfer.bucket
}