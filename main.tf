provider "azurerm" {
  alias = "src"
}

locals {
  servicename_role_environment = "${var.servicename}-${var.role}-${var.deploy_environment}"
}

resource "azurerm_eventhub_namespace" "eventhub_namespace" {
  provider            = azurerm.src
  name                = "m-${local.servicename_role_environment}-ns"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  capacity            = 2
  
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_eventhub" "eventhub" {
  provider            = azurerm.src
  name                = "m-${local.servicename_role_environment}-eh"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
  resource_group_name = var.resource_group_name
  partition_count     = var.partition_count
  message_retention   = var.message_retention
}

resource "azurerm_eventhub_consumer_group" "logstash_consumer_group" {
  provider            = azurerm.src
  name                = "logstash"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
  eventhub_name       = azurerm_eventhub.eventhub.name
  resource_group_name = var.resource_group_name
}

resource "azurerm_eventhub_consumer_group" "logging_application_consumer_group" {
  provider            = azurerm.src
  name                = "loggingApplication"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
  eventhub_name       = azurerm_eventhub.eventhub.name
  resource_group_name = var.resource_group_name
}

resource "azurerm_eventhub_authorization_rule" "logstash_rule" {
  provider            = azurerm.src
  name                = "logstashAccessKey"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
  eventhub_name       = azurerm_eventhub.eventhub.name
  resource_group_name = var.resource_group_name
  listen              = true
  send                = false
  manage              = false
}

resource "azurerm_eventhub_authorization_rule" "api_rule" {
  provider            = azurerm.src
  name                = "logAccessKey"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
  eventhub_name       = azurerm_eventhub.eventhub.name
  resource_group_name = var.resource_group_name
  listen              = false
  send                = true
  manage              = false
}

