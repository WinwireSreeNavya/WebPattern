output "app_service_name" {
  description = "The name of Web App"
  value       = azurerm_app_service.web_app_service.name
}
