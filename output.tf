output "id" {
  value = azurerm_service_plan.asp.id
}

output "name" {
  value = azurerm_service_plan.asp.name
}

output "resource_group" {
  value = azurerm_service_plan.asp.resource_group_name
}

output "sku" {
  value = azurerm_service_plan.asp.sku_name
}
