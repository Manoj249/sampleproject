resource "aws_sns_topic" "alarm_topic" {
  name = "cpu-alarm-topic"
}

resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.alarm_topic.arn
  protocol = "email"
  endpoint = var.alarm_email
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name = "ec2-cpu-utilization-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = 1
  metric_name = "CPUUtilization"
  namespace   = "AWS/EC2"
  period      = 300
  statistic   = "Average"
  threshold   = 80
  alarm_description = "CPU exceeds 80% for 5 minutes"
  alarm_actions = [aws_sns_topic.alarm_topic.arn]

  dimensions = {
    InstanceId = var.instance_id
  }
}