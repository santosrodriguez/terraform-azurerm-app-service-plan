variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "os_type" {
  type = string
  validation {
    condition = contains(["linux", "windows", "windowscontainer"], lower(var.os_type))
    error_message = "Invalid value provided.  Valid values are linux, windows, or windowscontainer"
  }
}

variable "resource_group_name" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "solution_name" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "zone_balancing_enabled" {
  type = bool
  default = false
}
