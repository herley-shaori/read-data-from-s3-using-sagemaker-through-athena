resource "aws_glue_crawler" "data_crawler" {
  name         = "${var.project_name}_my_data_crawler"
  database_name = aws_glue_catalog_database.default.name
  role      = aws_iam_role.glue_service_role.arn
  s3_target {
    path = "s3://${var.s3_bucket_id}/"
  }
  depends_on = [aws_glue_catalog_database.default]
}

resource "aws_glue_catalog_database" "default" {
  name = "s3_consumer_akmdkgnj4k34349f_my_data_database"
}