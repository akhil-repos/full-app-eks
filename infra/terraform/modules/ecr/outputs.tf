output "repository_arns" {
  value = [for r in aws_ecr_repository.app : r.arn]
}

output "repository_urls" {
  value = { for k, r in aws_ecr_repository.app : k => r.repository_url }
}
