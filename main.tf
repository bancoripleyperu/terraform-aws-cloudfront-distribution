resource "aws_cloudfront_distribution" "this" {
  origin {
    domain_name = var.domain_name
    origin_id   = var.origin_id

    dynamic "s3_origin_config" {
      for_each = var.origin_access_identity == null ? [] : [1]
      content {
        origin_access_identity = var.origin_access_identity
      }
    }
  }

  aliases             = var.aliases
  enabled             = var.enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  default_root_object = var.default_root_object

  default_cache_behavior {
    target_origin_id       = var.target_origin_id
    viewer_protocol_policy = var.viewer_protocol_policy
    allowed_methods        = var.allowed_methods
    cached_methods         = var.cached_methods

    forwarded_values {
      query_string = var.query_string

      cookies {
        forward = var.forward
      }
    }

    smooth_streaming = var.smooth_streaming
    compress         = var.compress

    dynamic "lambda_function_association" {
      for_each = var.lambda_function_association
      content {
        event_type   = lookup(lambda_function_association.value, "event_type", null)
        include_body = lookup(lambda_function_association.value, "include_body", null)
        lambda_arn   = lookup(lambda_function_association.value, "lambda_arn", null)
      }
    }
  }

  price_class  = var.price_class
  http_version = var.http_version

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = lookup(var.viewer_certificate, "cloudfront_default_certificate", null)
    ssl_support_method             = lookup(var.viewer_certificate, "ssl_support_method", null)
    acm_certificate_arn            = lookup(var.viewer_certificate, "acm_certificate_arn", null)
    minimum_protocol_version       = lookup(var.viewer_certificate, "minimum_protocol_version", null)
  }

  dynamic "custom_error_response" {
    for_each = var.custom_error_response

    content {
      error_code            = custom_error_response.value.error_code
      response_code         = custom_error_response.value.response_code
      response_page_path    = custom_error_response.value.response_page_path
      error_caching_min_ttl = custom_error_response.value.error_caching_min_ttl
    }
  }

  tags = var.tags
}