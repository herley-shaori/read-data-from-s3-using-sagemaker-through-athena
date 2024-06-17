resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.sagemaker_vpc.id
  cidr_block        = "10.0.0.0/26"
  availability_zone = "ap-southeast-3c"
  tags = {
    Name = "sagemaker_private_subnet"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.sagemaker_vpc.id
  cidr_block        = "10.0.0.128/26"
  availability_zone = "ap-southeast-3c"
  tags = {
    Name = "sagemaker_public_subnet"
  }
}