output "eventhub_namespace_name" {
  depends_on  = [azurerm_eventhub_namespace.eventhub_namespace]
  description = "name of the eventhub namespace"
  value       = azurerm_eventhub_namespace.eventhub_namespace.name
}

output "eventhub_name" {
  depends_on  = [azurerm_eventhub.eventhub]
  description = "name of the eventhub in the namespace"
  value       = azurerm_eventhub.eventhub.name
}
