variable "bucket_name" {
  type = string
}

variable "file_name" {
  description = "The name of the file to upload"
  type        = string
  default     = "iris.csv"
}

variable "file_path" {
  description = "The local path to the file to upload"
  type        = string
  default     = "iris.csv"
}