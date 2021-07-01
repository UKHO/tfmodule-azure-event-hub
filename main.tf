provider "azurerm" {
  alias = "src"
}

resource "azurerm_resource_group" "rg" {
    provider = azurerm.src
    name = "${var.name}-RG"  
    location = "UK South"
}

