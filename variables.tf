variable "service" {
  type = string
  description = "the service name"
}
variable "environment" {
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

variable "eventhub_namespace_id" {
  type = string
  description = "the event hub namespace id"
}
variable "eventhub_namespace_name" {
  type = string
  description = "the event hub namespace name"
}

variable "partition_count" {
  default = 2
}
variable "message_retention" {
  description = "depends on sku, Basic cannot be higher than 1"
  default = 7
}
