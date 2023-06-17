resource "aws_s3_bucket" "private" {
  bucket = "private-progmatic-terraform"
}


# バージョニングを有効化
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.private.id
  versioning_configuration {
    status = "Enabled"
  }
}

# 暗号化を有効化
# オブジェクト保存時に自動で暗号化、参照時に自動で複合化される
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.private.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_account_public_access_block" "private" {
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}