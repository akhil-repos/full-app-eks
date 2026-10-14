variable "name" {
  description = "Identifier prefix for the instance, subnet group and security group."
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  description = "Private subnets (at least 2 AZs) for the DB subnet group."
  type        = list(string)
}

variable "allowed_cidrs" {
  description = "CIDRs allowed to reach Postgres on 5432 (private subnets where the nodes run)."
  type        = list(string)
  default     = []
}

variable "allowed_security_group_ids" {
  description = "Security groups allowed to reach Postgres on 5432 (e.g. the EKS node group)."
  type        = list(string)
  default     = []
}

variable "db_name" {
  type    = string
  default = "appdb"
}

variable "username" {
  type    = string
  default = "appadmin"
}

variable "engine_version" {
  type    = string
  default = "16"
}

variable "instance_class" {
  type    = string
  default = "db.t4g.micro"
}

variable "allocated_storage" {
  description = "GiB, gp3."
  type        = number
  default     = 20
}

variable "multi_az" {
  description = "Standby in a second AZ; doubles the instance cost."
  type        = bool
  default     = false
}

variable "backup_retention_days" {
  type    = number
  default = 7
}

variable "deletion_protection" {
  type    = bool
  default = true
}

variable "rotation_interval_days" {
  description = "Days between automatic rotations of the managed master password (Secrets Manager maximum is 1000)."
  type        = number
  default     = 1000
}
