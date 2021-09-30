resource "azurerm_resource_group" "testerstore" {
    name = "testerstore"
    location = "centralus"
  
}


resource "azurerm_storage_account" "mystoreapplication" {
    name                     = "mystoreapplication"
    resource_group_name      = "${azurerm_resource_group.testerstore}"
    location                 = "azurerm_resource_group.mystoreapplication.location"
    account_tier             = "Standard"
    account_replication_type = "GRS"

     tags = {
    environment = "staging"
  }
}


resource "azuread_user" "Newuser" {
    user_principal_name = "sunnyroger04gmail.onmicrosoft.com"
    display_name        = "Newuser"
    mail_nickname       = "tester"
    password            = "p@ssword@12345"    
}

# Creating a Service Principal



