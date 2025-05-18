output "cloudfront_url" {
  description = "CloudFront Distribution URL"
  value       = "https://${aws_cloudfront_distribution.cdn.domain_name}"
}

output "s3_bucket" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.react_app.id
}

output "pipeline_url" {
  value = "https://console.aws.amazon.com/codesuite/codepipeline/pipelines/${aws_codepipeline.react_pipeline.name}/view"
}
