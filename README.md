# Pre-req
Setup the subscription id in an environment variable

linux cmd
`export ARM_SUBSCRIPTION_ID=<target subscription id>`

verify
`echo ARM_SUBSCRIPTION_ID` 

# Plan and Apply
`terraform init`

`terraform plan -var-file="./config/dev.tfvars`

`terraform apply -var-file="./config/dev.tfvars`

# Terratest
- navigate to tests
    - go mod download

- starting from scratch
`go mod init <module name>`
`go get github.com/gruntwork-io/terratest/modules/terraform`
`go get github.com/stretchr/testify`
`go get github.com/go-delve/delve/cmd/dlv@latest`

launch.json on root of TF-Verification folder
```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch Terratest",
            "type": "go",
            "request": "launch",
            "mode": "test",
            "program": "${workspaceFolder}/./tests/modules/storage_test.go",
            "args": [
                "-test.run",
                "TestStorageModule"
            ]
        }
    ]
}
```

# Troubleshooting
## Terratest
tfvar file path specified in test.
The `VarFiles: []string{"../../config/dev.tfvars"}` is relative to the `TerraformDir` specified.

Debugging
import (fmt)
fmt.Println("Plan output:", plan)

