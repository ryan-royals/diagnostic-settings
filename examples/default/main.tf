resource "random_string" "rg" {
  length  = 12
  special = false
  upper   = false
}
resource "random_string" "laws" {
  length  = 12
  special = false
  upper   = false
}
resource "random_string" "st" {
  length  = 12
  special = false
  upper   = false
}
resource "random_string" "st2" {
  length  = 12
  special = false
  upper   = false
}
resource "random_string" "container" {
  length  = 12
  special = false
  upper   = false
}
resource "random_string" "blob" {
  length  = 12
  special = false
  upper   = false
}


resource "azurerm_resource_group" "rg" {
  name     = random_string.rg.result
  location = "australiaEast"
}
resource "azurerm_log_analytics_workspace" "laws" {
  location            = "australiaEast"
  name                = random_string.laws.result
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_storage_account" "st" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = azurerm_resource_group.rg.location
  name                     = random_string.st.result
  resource_group_name      = azurerm_resource_group.rg.name
}
resource "azurerm_storage_account" "st2" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = azurerm_resource_group.rg.location
  name                     = random_string.st2.result
  resource_group_name      = azurerm_resource_group.rg.name
}
resource "azurerm_storage_container" "container" {
  name                 = random_string.container.result
  storage_account_name = azurerm_storage_account.st.name

}
resource "azurerm_storage_blob" "blob" {
  name                   = random_string.blob.result
  storage_account_name   = azurerm_storage_account.st.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
}



module "log" {
  source = "../../"

  log_analytics_workspace_id = azurerm_log_analytics_workspace.laws.id
  target_resource_ids = [
    "${azurerm_storage_account.st.id}/blobServices/default",
    azurerm_storage_account.st.id,
    azurerm_storage_account.st2.id
  ]
  log_category_types_overwrites = {
    "blobServices" = ["StorageDelete"]
  }
}
