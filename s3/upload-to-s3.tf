#resource "aws_s3_bucket_object" "iris_csv" {
#  bucket = aws_s3_bucket.data_bucket.bucket
#  key    = var.file_name
#  source = "${path.module}/${var.file_path}"
#}
