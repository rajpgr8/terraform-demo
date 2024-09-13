# terraform-demo

#### Pre-requisite commands
```
export TF_VAR_access_token=`gcloud auth print-access-token`

OR

# Use Service Account Key file
export GOOGLE_CREDENTIALS=../gcp-key.json   
```
#### Terraform commands
```
terraform init
terraform fmt 
terraform validate
terraform plan --var-file config/dev.tfvars
terraform apply --var-file config/dev.tfvars -auto-approve

terraform apply --refresh-only --var-file config/dev.tfvars
terraform destroy --var-file config/dev.tfvars
```