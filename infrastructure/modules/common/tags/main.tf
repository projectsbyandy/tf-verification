locals {
  base_tags = {
    environment = var.environment
    created_by  = "Terraform"
    project     = var.project
    managed_by = "Terraform"
    created_by = formatdate("YYYY-MM-DD", timestamp())
  }
}