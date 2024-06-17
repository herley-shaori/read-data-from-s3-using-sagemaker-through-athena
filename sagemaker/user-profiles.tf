# Create a user profile for "herley"
resource "aws_sagemaker_user_profile" "herley" {
  domain_id     = aws_sagemaker_domain.example.id
  user_profile_name = "herley"
  user_settings {
    execution_role = aws_iam_role.sagemaker_execution_role.arn
  }
}