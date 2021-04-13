## Usage

```hcl
module "this" {
  source  = "bancoripleyperu/cloudfront-distribution/aws"
  version = "0.0.1"

  domain_name      = module.s3-bucket.values.bucket_regional_domain_name
  origin_id        = module.s3-bucket.values.id
  target_origin_id = module.s3-bucket.values.id
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.19 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.19 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aliases"></a> [aliases](#input\_aliases) | Domain aliases. | `list(string)` | `[]` | no |
| <a name="input_allowed_methods"></a> [allowed\_methods](#input\_allowed\_methods) | Allowed methods. | `list(string)` | <pre>[<br>  "DELETE",<br>  "GET",<br>  "HEAD",<br>  "OPTIONS",<br>  "PATCH",<br>  "POST",<br>  "PUT"<br>]</pre> | no |
| <a name="input_cached_methods"></a> [cached\_methods](#input\_cached\_methods) | Cached methods. | `list(string)` | <pre>[<br>  "GET",<br>  "HEAD"<br>]</pre> | no |
| <a name="input_compress"></a> [compress](#input\_compress) | Compress. | `bool` | `false` | no |
| <a name="input_custom_error_response"></a> [custom\_error\_response](#input\_custom\_error\_response) | (Optional) List of custom error response configurations for cloudFront distribution. | <pre>set(object({<br>    error_code            = number<br>    response_code         = number<br>    response_page_path    = string<br>    error_caching_min_ttl = number<br>  }))</pre> | `[]` | no |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | Default root object. | `string` | `"index.html"` | no |
| <a name="input_default_ttl"></a> [default\_ttl](#input\_default\_ttl) | (Optional) The default ttl cache. | `number` | `3600` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Origin domain name. | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Enabled distribution | `bool` | `true` | no |
| <a name="input_forward"></a> [forward](#input\_forward) | Cookies forward. | `string` | `"none"` | no |
| <a name="input_http_version"></a> [http\_version](#input\_http\_version) | Http version. | `string` | `"http2"` | no |
| <a name="input_is_ipv6_enabled"></a> [is\_ipv6\_enabled](#input\_is\_ipv6\_enabled) | Enabled ipv6. | `bool` | `false` | no |
| <a name="input_lambda_function_association"></a> [lambda\_function\_association](#input\_lambda\_function\_association) | (Optional) A mapping containing lambda function association. | <pre>list(object({<br>    event_type   = string<br>    include_body = bool<br>    lambda_arn   = string<br>  }))</pre> | `[]` | no |
| <a name="input_max_ttl"></a> [max\_ttl](#input\_max\_ttl) | (Optional) The max ttl cache. | `number` | `86400` | no |
| <a name="input_min_ttl"></a> [min\_ttl](#input\_min\_ttl) | (Optional) The min ttl cache. | `number` | `0` | no |
| <a name="input_origin_access_identity"></a> [origin\_access\_identity](#input\_origin\_access\_identity) | (Optional) The origin access identity. | `string` | `null` | no |
| <a name="input_origin_id"></a> [origin\_id](#input\_origin\_id) | Origin id. | `string` | n/a | yes |
| <a name="input_price_class"></a> [price\_class](#input\_price\_class) | Price class of the distribution. | `string` | `"PriceClass_100"` | no |
| <a name="input_query_string"></a> [query\_string](#input\_query\_string) | Query string. | `bool` | `false` | no |
| <a name="input_smooth_streaming"></a> [smooth\_streaming](#input\_smooth\_streaming) | Smooth streaming. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the bucket. | `map(string)` | `{}` | no |
| <a name="input_target_origin_id"></a> [target\_origin\_id](#input\_target\_origin\_id) | Target origin id. | `string` | n/a | yes |
| <a name="input_viewer_certificate"></a> [viewer\_certificate](#input\_viewer\_certificate) | The SSL configuration for this distribution. | `any` | <pre>{<br>  "cloudfront_default_certificate": true<br>}</pre> | no |
| <a name="input_viewer_protocol_policy"></a> [viewer\_protocol\_policy](#input\_viewer\_protocol\_policy) | Viewer protocol policy. | `string` | `"redirect-to-https"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_values"></a> [values](#output\_values) | All outputs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Test

```sh
gem install bundler
bundle install --jobs 4 --retry 3
bundle exec kitchen test
```

## Doc

```sh
pre-commit run -a
```

## Autor
 
Module managed by [Banco Ripley Peru](https://ripley.com.pe)