resource "aws_athena_named_query" "sample_query" {
  name      = "${var.project_name}-SampleQuery"
  database  = var.glue_database_name
  query     = <<EOF
SELECT * FROM my_table LIMIT 10;
EOF
  workgroup = aws_athena_workgroup.main.name
}

resource "aws_athena_workgroup" "main" {
  name = "${var.project_name}-primary"
  configuration {
    result_configuration {
      output_location = "s3://${var.s3_bucket_id}/athena-results/"
    }
  }
}