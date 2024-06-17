output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "vpc_id" {
  value = aws_vpc.sagemaker_vpc.id
}

output "sagemaker_domain_id" {
  description = "The ID of the SageMaker domain"
  value       = aws_sagemaker_domain.example.id
}

output "sagemaker_execution_role_arn" {
  description = "The ARN of the SageMaker execution role"
  value       = aws_iam_role.sagemaker_execution_role.arn
}

output "sagemaker_security_group_id" {
  description = "The ID of the SageMaker security group"
  value       = aws_security_group.sagemaker_sg.id
}

output "sagemaker_user_profile_herley" {
  description = "The user profile name of Herley"
  value       = aws_sagemaker_user_profile.herley.user_profile_name
}