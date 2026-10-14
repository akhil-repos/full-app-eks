variable "role_name" {
  type    = string
  default = "app-github-ecr-push"
}

variable "github_repo" {
  description = "owner/name of the repo allowed to assume the role."
  type        = string
}

variable "branch" {
  type    = string
  default = "main"
}

variable "ecr_repository_arns" {
  description = "Repositories the role may push to."
  type        = list(string)
}
