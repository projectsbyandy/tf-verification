variable "rg_qa_name" {
  description = "The name of the resource group where resources will be created"
  type        = string
}

variable "region" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "environment" {
  description = "The environment for the resources (e.g., dev, qa, prod)"
  type        = string
}

variable "project" {
  description = "The project name for the resources"
  type        = string
}

# Pick up from the ARM_SUBSCRIPTION_ID environment variable if not set
variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
  default     = null
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "container_name" {
  description = "The name of the blob container"
  type        = string
}