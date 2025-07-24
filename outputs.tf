output "eventhub_name" {
  depends_on  = [azurerm_eventhub.eventhub]
  description = "name of the eventhub in the namespace"
  value       = azurerm_eventhub.eventhub.name
}

output "eventhub_send_primarykey" {
  depends_on  = [azurerm_eventhub.eventhub]
  description = "Send Key"
  value       = azurerm_eventhub_authorization_rule.api_rule_send.primary_key
}
