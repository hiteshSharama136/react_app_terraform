data "aws_secretsmanager_secret_version" "github" {
  secret_id = var.github_token_secret_name
}

