resource "aws_vpc" "sagemaker_vpc" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "sagemaker_vpc"
  }
}