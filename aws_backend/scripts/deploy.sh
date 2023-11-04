terraform init -backend-config="config/backend.tfvars"

terraform plan -var-file="config/terraform.tfvars" -out=".terraform/terraform.tfplan"

terraform apply ".terraform/terraform.tfplan"
