variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "department_name" {
    default = "cm"
     description = "Name of the department for which project needs to be created."
}

variable "project_name" {
    default = "loanstatus"
     description = "Name of the application."
}

variable "environment_name" {
    default = "prod"
     description = "Environment to be provisioned."
}
