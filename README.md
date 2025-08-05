# Pre-req
Setup the subscription id in an environment variable

linux cmd
`export ARM_SUBSCRIPTION_ID=<target subscription id>`

# Plan and Apply
`terraform init`

`terraform plan -var-file="./config/dev.tfvars`

`terraform apply -var-file="./config/dev.tfvars`

