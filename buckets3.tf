resource "aws_s3_bucket" "monBucket" {
  bucket = "ynov-infracloud-grattardmathieu2"
}

resource "aws_s3_object" "puppy_image" {
  bucket = aws_s3_bucket.monBucket.id
  key    = "assets/puppy.jpg"
  source = "assets/puppy.jpg"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.monBucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  
}

resource "aws_s3_bucket_policy" "bucket_policy_monBucket" {
  bucket = aws_s3_bucket.monBucket.id
  depends_on = [aws_s3_bucket_public_access_block.example] 
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.monBucket.arn}/*"
      },
    ]
  })
}