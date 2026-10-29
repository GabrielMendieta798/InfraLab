resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name        = "infralab-high-cpu"
  alarm_description = "Triggers when EC2 CPU exceeds 80 percent"

  namespace   = "AWS/EC2"
  metric_name = "CPUUtilization"

  statistic           = "Average"
  period              = 300
  evaluation_periods  = 1
  threshold           = 80
  comparison_operator = "GreaterThanThreshold"

  dimensions = {
    InstanceId = aws_instance.monitoring.id
  }

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

  ok_actions = [
    aws_sns_topic.alerts.arn
  ]

  treat_missing_data = "missing"

  tags = {
    Name        = "InfraLab-High-CPU"
    Environment = "Lab"
    Project     = "InfraLab"
    ManagedBy   = "Terraform"
  }
}