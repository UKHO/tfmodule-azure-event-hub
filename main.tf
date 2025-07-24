

locals {
  service_role = "${var.product}-${var.service}-${var.role}-${var.environment}"
}

resource "azurerm_eventhub" "eventhub" {
  provider            = azurerm.src
  name                = "m-${local.service_role}-evh"
  namespace_id      = var.eventhub_namespace_id
  partition_count     = var.partition_count
  message_retention   = var.message_retention
}

resource "azurerm_eventhub_consumer_group" "logging_application_consumer_group" {
  provider            = azurerm.src
  name                = "loggingApplication"
  namespace_name      = var.eventhub_namespace_name
  eventhub_name       = azurerm_eventhub.eventhub.name
  resource_group_name = var.resource_group_name
}

resource "azurerm_eventhub_authorization_rule" "api_rule_send" {
  provider            = azurerm.src
  name                = "SendAccessKey"
  namespace_name      = var.eventhub_namespace_name
  eventhub_name       = azurerm_eventhub.eventhub.name
  resource_group_name = var.resource_group_name
  listen              = false
  send                = true
  manage              = false
}
