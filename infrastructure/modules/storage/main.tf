resource "azurerm_storage_account" "emulsive-storage-account" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_qa_name
  location                 = var.region
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = false
  default_to_oauth_authentication = true
  is_hns_enabled = true

  tags = var.tags
}

resource "azurerm_storage_container" "emulsive-storage-container" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.emulsive-storage-account.id
  container_access_type = "private"
}

data "azurerm_subscription" "current" {}
data "azurerm_client_config" "current" {}

resource "azurerm_role_assignment" "storage_account_contributor" {
  scope                = azurerm_storage_account.emulsive-storage-account.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_storage_blob" "sample_blob" {
  name                   = "sample.txt"
  storage_account_name   = azurerm_storage_account.emulsive-storage-account.name
  storage_container_name = azurerm_storage_container.emulsive-storage-container.name
  type                   = "Block"
  source                 = "${path.module}/sample.txt"

  depends_on = [azurerm_role_assignment.storage_account_contributor]
}