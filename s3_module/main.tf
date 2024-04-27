resource "aws_s3_bucket" "primary_bucket" {
  bucket = "my-primary-bucket5624"
}

resource "aws_s3_bucket" "secondary_bucket" {
  bucket = "my-secondary-bucket5624"
}

output "primary_bucket_arn" {
  value = aws_s3_bucket.primary_bucket.arn
}

output "secondary_bucket_arn" {
  value = aws_s3_bucket.secondary_bucket.arn
}
