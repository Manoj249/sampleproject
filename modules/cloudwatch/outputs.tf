output "alarm_name" {
  value = aws_cloudwatch_metric_alarm.cpu_alarm.alarm_name
}

output "alarm_arn" {
  value = aws_cloudwatch_metric_alarm.cpu_alarm.arn
}

output "sns_topic_arn" {
  value = aws_sns_topic.alarm_topic.arn
}