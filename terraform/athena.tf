variable "db_name" {
  default = "vehicles_db"
}

resource "aws_athena_database" "vehicles" {
  name   = var.db_name
  bucket = aws_s3_bucket.vehicles_bucket.bucket
}

resource "aws_glue_catalog_table" "aws_glue_catalog_table" {
  name          = "vehicle"
  database_name = var.db_name

  storage_descriptor {
    location      = "s3://vehicle-athena-db/"
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.mapred.TextInputFormat"


    ser_de_info {
      name                  = "vehicle_serializer"
      serialization_library = "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe"

      parameters = {
        "field.delim"            = "|"
        "skip.header.line.count" = "1"
      }
    }

    columns {
      name = "vin"
      type = "string"
    }

    columns {
      name = "make"
      type = "string"
    }

    columns {
      name = "dealer_key"
      type = "string"
    }
  }
}


