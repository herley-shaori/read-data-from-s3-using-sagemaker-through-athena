module "s3" {
  source = "./s3"
  bucket_name = "${local.project_name}-ksnfkeneeeg78686-data"
}

module "glue" {
  source = "./glue"
  s3_bucket_id = module.s3.bucket_id
  project_name = local.project_name
}

module "sagemaker" {
  source = "./sagemaker"
  s3_bucket = module.s3.bucket_bucket
}

#module "athena" {
#  source = "./athena"
#  s3_bucket_id = module.s3.bucket_id
#  project_name = local.project_name
#  glue_database_name = module.glue.glue_database_name
#}