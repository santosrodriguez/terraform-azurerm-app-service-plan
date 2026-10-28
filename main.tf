terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    }
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
  }
}

resource "random_string" "suffix" {
  length = 4
  numeric = false
  upper = false
}

data "azurecaf_name" "asp_name" {
  resource_type = "azurerm_app_service_plan"
  suffixes = [ var.solution_name, var.location, var.environment, random_string.suffix.result ]
}

resource "azurerm_service_plan" "asp" {
  name = data.azurecaf_name.asp_name.result
  location = var.location
  resource_group_name = var.resource_group_name
  os_type = title(var.os_type)
  sku_name = var.sku_name
  tags = var.tags
  zone_balancing_enabled = var.zone_balancing_enabled
}
