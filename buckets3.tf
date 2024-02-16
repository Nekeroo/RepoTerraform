resource "aws_s3_bucket" "monBucket" {
  bucket = "ynov-infracloud-grattardmathieu"

}

resource "aws_s3_object" "puppy_image" {
  bucket = aws_s3_bucket.monBucket.id
  key    = "puppy_image"
  source = "assets/puppy.jpg"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.monBucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
