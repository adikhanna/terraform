resource "aws_s3_bucket" "updata-tf-remote-state" {
  bucket = "updata-tf-remote-state"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

