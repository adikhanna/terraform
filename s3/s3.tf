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

resource "aws_s3_bucket" "updata-lb-access-logs" {
  bucket = "updata-lb-access-logs"
  policy = "${file("./s3/updata_lb_access_logs_policy.json")}"

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