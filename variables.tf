variable "domain_name" {
  description = "Origin domain name."
  type        = string
}

variable "origin_id" {
  description = "Origin id."
  type        = string
}

variable "aliases" {
  description = "Domain aliases."
  type        = list(string)
  default     = []
}

variable "enabled" {
  description = "Enabled distribution"
  type        = bool
  default     = true
}

variable "is_ipv6_enabled" {
  description = "Enabled ipv6."
  type        = bool
  default     = false
}

variable "default_root_object" {
  description = "Default root object."
  type        = string
  default     = "index.html"
}

variable "target_origin_id" {
  description = "Target origin id."
  type        = string
}

variable "viewer_protocol_policy" {
  description = "Viewer protocol policy."
  type        = string
  default     = "redirect-to-https"
}

variable "allowed_methods" {
  description = "Allowed methods."
  type        = list(string)
  default     = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
}

variable "cached_methods" {
  description = "Cached methods."
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "query_string" {
  description = "Query string."
  type        = bool
  default     = false
}

variable "forward" {
  description = "Cookies forward."
  type        = string
  default     = "none"
}

variable "smooth_streaming" {
  description = "Smooth streaming."
  type        = bool
  default     = false
}

variable "compress" {
  description = "Compress."
  type        = bool
  default     = false
}

variable "price_class" {
  description = "Price class of the distribution."
  type        = string
  default     = "PriceClass_100"
}

variable "http_version" {
  description = "Http version."
  type        = string
  default     = "http2"
}

variable "custom_error_response" {
  description = "(Optional) List of custom error response configurations for cloudFront distribution."
  type = set(object({
    error_code            = number
    response_code         = number
    response_page_path    = string
    error_caching_min_ttl = number
  }))
  default = []
}

variable "viewer_certificate" {
  description = "The SSL configuration for this distribution."
  type        = any
  default = {
    cloudfront_default_certificate = true
  }
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "lambda_function_association" {
  description = "(Optional) A mapping containing lambda function association."
  type = list(object({
    event_type   = string
    include_body = bool
    lambda_arn   = string
  }))
  default = []
}

variable "origin_access_identity" {
  description = "(Optional) The origin access identity."
  type        = string
  default     = null
}