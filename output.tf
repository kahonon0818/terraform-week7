output "public-ip" {
    value = aws_instance.ec2-demo.public_ip
}

# Output the ARN of the DynamoDB table for reference
output "dynamodb_table_arn" {
  value = aws_dynamodb_table.terraform_state_lock.arn
} 