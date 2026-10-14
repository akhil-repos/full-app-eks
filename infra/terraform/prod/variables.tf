variable "region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name; used for naming and subnet discovery tags."
  type        = string
  default     = "app-prod"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "github_repo" {
  description = "owner/name of the GitHub repo allowed to push images."
  type        = string
  default     = "akhilthekkuveettil/full-app-eks"
}

variable "services" {
  type    = list(string)
  default = ["backend1", "backend2", "backend3", "backend4", "frontend"]
}
