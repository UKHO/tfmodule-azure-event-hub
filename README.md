# Terraform Module: for Azure Event Hub

use module resource to reference this service.

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
variable "sku" {
  type = string
}
variable "partition_count" {
  default = 2
}
variable "message_retention" {
  description = "depends on sku, Basic cannot be higher than 1"
  default = 7
}

module "eventhub" {
  source                       = "github.com/ukho/tfmodule-azure-event-hub?ref=0.2.0"
  providers = {
    azurerm.src = azurerm.alias
  }
  
  servicename                 = var.servicename
  deploy_environment          = var.deploy_environment
  role                        = var.role
  resource_group_name         = var.resource_group_name
  resource_group_location     = var.resource_group_location
  sku                         = var.sku
  partition_count             = var.partition_count
  message_retention           = var.message_retention
 }
```
