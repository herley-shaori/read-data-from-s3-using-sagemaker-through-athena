# Create a security group that allows traffic within itself
resource "aws_security_group" "sagemaker_sg" {
  name        = "sagemaker_sg"
  description = "Security group for SageMaker"
  vpc_id      = aws_vpc.sagemaker_vpc.id
  tags = {
    Name = "sagemaker"
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    self        = true
    description = "Allow traffic from within itself."
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [aws_subnet.private_subnet.cidr_block]
    description = "Allow traffic from private subnet."
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    description = "Traffic to the world."
  }
}