variable "repositories" {
  description = "Full repository names, e.g. app/backend1."
  type        = list(string)
}

variable "keep_images" {
  description = "Images kept per repository; older ones expire."
  type        = number
  default     = 10
}
