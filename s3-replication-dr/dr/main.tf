resource "aws_s3_bucket" "current" {

  provider = aws.current

  bucket = var.source_bucket
}

resource "aws_s3_bucket_versioning" "current" {

  provider = aws.current

  bucket = aws_s3_bucket.current.id

  versioning_configuration {

    status = "Enabled"

  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "current" {

  provider = aws.current

  bucket = aws_s3_bucket.current.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }
}

resource "aws_s3_bucket_public_access_block" "current" {

  provider = aws.current

  bucket = aws_s3_bucket.current.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

################## DR Bucket####################

resource "aws_s3_bucket" "dr" {

  provider = aws.dr

  bucket = var.destination_bucket
}

resource "aws_s3_bucket_versioning" "dr" {

  provider = aws.dr

  bucket = aws_s3_bucket.dr.id

  versioning_configuration {

    status = "Enabled"

  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dr" {

  provider = aws.dr

  bucket = aws_s3_bucket.dr.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }
}

resource "aws_s3_bucket_public_access_block" "dr" {

  provider = aws.dr

  bucket = aws_s3_bucket.dr.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
