package test

import (
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestStorageAccount(t *testing.T) {
	t.Parallel()

	subscriptionID := os.Getenv("ARM_SUBSCRIPTION_ID")
	if subscriptionID == "" {
		t.Fatal("ARM_SUBSCRIPTION_ID environment variable is not set")
	}

	// Arrange
	terraformConfig := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../infrastructure",
		Vars: map[string]interface{}{
			"subscription_id": subscriptionID,
			"container_name":  "qa-terratest-container",
		},
		VarFiles: []string{"config/dev.tfvars"},
	})

	// Act
	plan := terraform.InitAndPlanAndShowWithStructNoLogTempPlanFile(t, terraformConfig)
	storageAccount := plan.ResourcePlannedValuesMap["module.storage.azurerm_storage_account.emulsive-storage-account"]

	// Assert
	assert.NotNil(t, storageAccount, "Storage account should not be null")
	assert.Equal(t, "rg-emulsive-qa", storageAccount.AttributeValues["resource_group_name"], "Storage account resource group should match expected value")

}
