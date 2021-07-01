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
