provider "aws" {
  region = "ap-southeast-3"
  default_tags {
    tags = {
      environment     = "Development"
      team            = "DevOps"
      managed-by      = "Terraform"
      author          = "herley.shaori@gmail.com"
    }
  }
}