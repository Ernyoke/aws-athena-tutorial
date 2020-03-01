resource "aws_s3_bucket" "vehicles_bucket" {
  bucket = "vehicles-athena-db-queries"
}

resource "aws_s3_bucket" "athena_express_bucket" {
  bucket = "vehicles-athena-express-db-queries"
}
