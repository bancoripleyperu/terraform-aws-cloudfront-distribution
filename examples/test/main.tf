module "this" {
  source = "../../"

  domain_name      = module.s3-bucket.values.bucket_regional_domain_name
  origin_id        = module.s3-bucket.values.id
  target_origin_id = module.s3-bucket.values.id

  tags = {
    Project = "titan"
  }
}

# dependencies
resource "random_string" "this" {
  length  = 8
  special = false
  upper   = false
}

module "s3-bucket" {
  source  = "bancoripleyperu/s3-bucket/aws"
  version = "0.0.5"

  bucket        = random_string.this.result
  force_destroy = true

  tags = {
    Project = "titan"
  }
}