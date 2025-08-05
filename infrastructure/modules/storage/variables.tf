variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "container_name" {
  description = "The name of the blob container"
  type        = string
}

variable "rg_qa_name" {
  description = "The name of the resource group where resource will be created"
  type        = string
}

variable "region" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the storage account"
  type        = map(string)
  default     = {}
}