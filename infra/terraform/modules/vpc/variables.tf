variable "name" {
  description = "Name prefix, also the EKS cluster name used in subnet discovery tags."
  type        = string
}

variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "az_count" {
  description = "Number of AZs; EKS needs at least 2."
  type        = number
  default     = 2
}
