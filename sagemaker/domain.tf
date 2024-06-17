# Create the SageMaker domain
resource "aws_sagemaker_domain" "example" {
  domain_name = "read-from-athena-using-sql"
  auth_mode   = "IAM"
  vpc_id      = aws_vpc.sagemaker_vpc.id
  subnet_ids  = [aws_subnet.private_subnet.id]
  default_user_settings {
    execution_role = aws_iam_role.sagemaker_execution_role.arn
    security_groups = [aws_security_group.sagemaker_sg.id]
  }
}