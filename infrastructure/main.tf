locals {
  common_tags = module.tags.base_tags
}

module "tags" {
  source      = "./modules/common/tags"

  environment = var.environment
  project     = var.project
}

module "storage" {
  source = "./modules/storage"

  storage_account_name = var.storage_account_name
  container_name       = var.container_name
  rg_qa_name           = azurerm_resource_group.emulsive_qa.name
  region               = azurerm_resource_group.emulsive_qa.location
  tags = merge(local.common_tags, {
      service = "storage"
  })

  depends_on = [ azurerm_resource_group.emulsive_qa ]
}

resource "azurerm_resource_group" "emulsive_qa" {
  name     = var.rg_qa_name
  location = var.region
  tags = merge(local.common_tags, {
    service = "rg"
  })
}
