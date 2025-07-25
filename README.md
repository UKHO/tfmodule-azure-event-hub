# Terraform Module: for Azure Event Hub

use module resource to reference this service. This module does not create the namespace

## Required Resources

- `Resource Group` exists or is created external to the module.
- `Provider` must be created external to the module.

## Usage

```terraform
variable "servicename" {
  type = string
  description = "the service name"
}
variable "deploy_environment" {
  type = string
  description = "deployment environment"
}
variable "role" {
  type = string
  description = "it's role within the service"
}
variable "resource_group_name" {
  type = string
}
variable "resource_group_location" {
  type = string
}

variable "eventhub_namespace_id" {
  type = string
  description = "the event hub namespace id"
}
variable "eventhub_namespace_name" {
  type = string
  description = "the event hub namespace name"
}

variable "sku" {
  description = "Basic, Standard or Premium, services and options will vary depending on level, check docs for desires. Default to standard"
  type = string
  default = "Standard"
}
variable "partition_count" {
  default = 2
}
variable "message_retention" {
  description = "depends on sku, Basic cannot be higher than 1"
  default = 7
}

module "eventhub" {
  source                       = "github.com/ukho/tfmodule-azure-event-hub?ref=0.8.1"
  providers = {
    azurerm.src = azurerm.alias
  }

  eventhub_namespace_id       = var.eventhub_namespace_id
  eventhub_namespace_name     = var.eventhub_namespace_name
  servicename                 = var.servicename
  deploy_environment          = var.deploy_environment
  role                        = var.role
  resource_group_name         = var.resource_group_name
  resource_group_location     = var.resource_group_location
 }
```

## Outputs

This module outputs 2 values, one is `eventhub_send_primarykey` and the other is `event_hub_name`