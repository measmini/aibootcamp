output "current_bucket" {

  value = aws_s3_bucket.current.bucket

}

output "dr_bucket" {

  value = aws_s3_bucket.dr.bucket

}