---
subcategory: "CloudFront"
layout: "aws"
page_title: "AWS: aws_cloudfront_response_headers_policy"
description: |-
  Use this data source to retrieve information about a CloudFront response headers policy.
---

# Data Source: aws_cloudfront_response_headers_policy

Use this data source to retrieve information about a CloudFront cache policy.

## Example Usage

### Basic Usage

```terraform
data "aws_cloudfront_response_headers_policy" "example" {
  name = "example-policy"
}
```

### AWS-Managed Policies

AWS managed response header policy names are prefixed with `Managed-`:

```terraform
data "aws_cloudfront_response_headers_policy" "example" {
  name = "Managed-SimpleCORS"
}
```

## Argument Reference

This data source supports the following arguments:

* `name` - (Optional) Unique name to identify the response headers policy.
* `id` - (Optional) Identifier for the response headers policy.

## Attribute Reference

This data source exports the following attributes in addition to the arguments above:

* `arn` - The response headers policy ARN.
* `comment` - Comment to describe the response headers policy. The comment cannot be longer than 128 characters.
* `etag` - Current version of the response headers policy.
* `cors_config` - Configuration for a set of HTTP response headers that are used for Cross-Origin Resource Sharing (CORS). See [Cors Config](#cors-config) for more information.
* `custom_headers_config` - Object that contains an attribute `items` that contains a list of Custom Headers. See [Custom Header](#custom-header) for more information.
* `remove_headers_config` - Object that contains an attribute `items` that contains a list of Remove Headers. See [Remove Header](#remove-header) for more information.
* `security_headers_config` - A configuration for a set of security-related HTTP response headers. See [Security Headers Config](#security-headers-config) for more information.
* `server_timing_headers_config` - (Optional) Configuration for enabling the Server-Timing header in HTTP responses sent from CloudFront. See [Server Timing Headers Config](#server-timing-headers-config) for more information.

### Cors Config

* `access_control_allow_credentials` - A Boolean value that CloudFront uses as the value for the Access-Control-Allow-Credentials HTTP response header.
* `access_control_allow_headers` - Object that contains an attribute `items` that contains a list of HTTP header names that CloudFront includes as values for the Access-Control-Allow-Headers HTTP response header.
* `access_control_allow_methods` - Object that contains an attribute `items` that contains a list of HTTP methods that CloudFront includes as values for the Access-Control-Allow-Methods HTTP response header. Valid values: `GET` | `POST` | `OPTIONS` | `PUT` | `DELETE` | `HEAD` | `ALL`
* `access_control_allow_origins` - Object that contains an attribute `items` that contains a list of origins that CloudFront can use as the value for the Access-Control-Allow-Origin HTTP response header.
* `access_control_expose_headers` - Object that contains an attribute `items` that contains a list of HTTP headers that CloudFront includes as values for the Access-Control-Expose-Headers HTTP response header.
* `access_control_max_age_sec` - A number that CloudFront uses as the value for the Access-Control-Max-Age HTTP response header.

### Custom Header

* `header` - HTTP response header name.
* `override` - Whether CloudFront overrides a response header with the same name received from the origin with the header specifies here.
* `value` - Value for the HTTP response header.

### Remove Header

* `header` - The HTTP header name.

### Security Headers Config

* `content_security_policy` - The policy directives and their values that CloudFront includes as values for the Content-Security-Policy HTTP response header. See [Content Security Policy](#content-security-policy) for more information.
* `content_type_options` - A setting that determines whether CloudFront includes the X-Content-Type-Options HTTP response header with its value set to nosniff. See [Content Type Options](#content-type-options) for more information.
* `frame_options` - Setting that determines whether CloudFront includes the X-Frame-Options HTTP response header and the header’s value. See [Frame Options](#frame-options) for more information.
* `referrer_policy` - Setting that determines whether CloudFront includes the Referrer-Policy HTTP response header and the header’s value. See [Referrer Policy](#referrer-policy) for more information.
* `strict_transport_security` - Settings that determine whether CloudFront includes the Strict-Transport-Security HTTP response header and the header’s value. See [Strict Transport Security](#strict-transport-security) for more information.
* `xss_protection` - Settings that determine whether CloudFront includes the X-XSS-Protection HTTP response header and the header’s value. See [XSS Protection](#xss-protection) for more information.

### Content Security Policy

* `content_security_policy` - The policy directives and their values that CloudFront includes as values for the Content-Security-Policy HTTP response header.
* `override` - Whether CloudFront overrides the Content-Security-Policy HTTP response header received from the origin with the one specified in this response headers policy.

### Content Type Options

* `override` - Whether CloudFront overrides the X-Content-Type-Options HTTP response header received from the origin with the one specified in this response headers policy.

### Frame Options

* `frame_option` - Value of the X-Frame-Options HTTP response header. Valid values: `DENY` | `SAMEORIGIN`
* `override` - Whether CloudFront overrides the X-Frame-Options HTTP response header received from the origin with the one specified in this response headers policy.

### Referrer Policy

* `referrer_policy` - Value of the Referrer-Policy HTTP response header. Valid Values: `no-referrer` | `no-referrer-when-downgrade` | `origin` | `origin-when-cross-origin` | `same-origin` | `strict-origin` | `strict-origin-when-cross-origin` | `unsafe-url`
* `override` - Whether CloudFront overrides the Referrer-Policy HTTP response header received from the origin with the one specified in this response headers policy.

### Strict Transport Security

* `access_control_max_age_sec` - A number that CloudFront uses as the value for the max-age directive in the Strict-Transport-Security HTTP response header.
* `include_subdomains` - Whether CloudFront includes the includeSubDomains directive in the Strict-Transport-Security HTTP response header.
* `override` - Whether CloudFront overrides the Strict-Transport-Security HTTP response header received from the origin with the one specified in this response headers policy.
* `preload` - Whether CloudFront includes the preload directive in the Strict-Transport-Security HTTP response header.

### XSS Protection

* `mode_block` - Whether CloudFront includes the mode=block directive in the X-XSS-Protection header.
* `override` - Whether CloudFront overrides the X-XSS-Protection HTTP response header received from the origin with the one specified in this response headers policy.
* `protection` - Boolean value that determines the value of the X-XSS-Protection HTTP response header. When this setting is true, the value of the X-XSS-Protection header is 1. When this setting is false, the value of the X-XSS-Protection header is 0.
* `report_uri` - Whether CloudFront sets a reporting URI in the X-XSS-Protection header.

### Server Timing Headers Config

* `enabled` - Whether CloudFront adds the `Server-Timing` header to HTTP responses that it sends in response to requests that match a cache behavior that's associated with this response headers policy.
* `sampling_rate` - Number 0–100 (inclusive) that specifies the percentage of responses that you want CloudFront to add the Server-Timing header to.
