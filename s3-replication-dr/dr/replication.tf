resource "aws_s3_bucket_replication_configuration" "crr" {

  provider = aws.current

  depends_on = [

    aws_s3_bucket_versioning.current,
    aws_s3_bucket_versioning.dr

  ]

  bucket = aws_s3_bucket.current.id

  role = aws_iam_role.replication.arn

  rule {

    id = "DisasterRecovery"

    status = "Enabled"

    filter {}

    destination {

      bucket = aws_s3_bucket.dr.arn

      storage_class = "STANDARD"

    }

    delete_marker_replication {

      status = "Enabled"

    }
  }
}