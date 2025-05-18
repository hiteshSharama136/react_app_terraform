variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment name (test/stage/prod)"
  type        = string
}

variable "github_owner" {
  description = "GitHub repo owner"
  type        = string
}

variable "github_repo" {
  description = "GitHub repo name"
  type        = string
}

variable "github_branch" {
  description = "Branch to track"
  default     = "master"
}

variable "s3_bucket" {
  description = "S3 bucket to deploy app"
  type        = string
}

variable "cloudfront_distribution_id" {
  description = "CloudFront distribution ID for invalidation"
  type        = string
}

variable "github_token_secret_name" {
  default = "github-token"
}
