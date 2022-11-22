variable "environment" {
  type        = string
  description = "One of (dev, qa, prod)"
  validation {
    condition     = contains(["dev", "qa", "test", "prod"], var.environment)
    error_message = "Unexpected environment."
  }
  default = "dev"
}

