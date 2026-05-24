#

##

```t


terraform plan --var-file=a05_05_vm_instance.tfvars



```

## Input variable a s environment variables (Unix or Linux environment)

```t
# Comment machine_type in terraform.tfvars
#machine_type  = "e2-micro"

# Set Environment Variable
export TF_VAR_machine_type="e2-standard-2"
echo $TF_VAR_machine_type


export MACHINE_TYPE ="e2-standard-2"
echo $MACHINE_TYPE

# Run Terraform Plan
terraform plan
Observation: Machine type configured will be "e2-standard-2" from environment variable set

# Unset Environment variable
unset TF_VAR_machine_type
echo $TF_VAR_machine_type

# Run Terraform Plan
terraform plan
Observation: Machine type configured will be "e2-small" from variables.tf default value

# Variable Precendence
Priority-1: Any -var and -var-file options on the command line, in the order they are provided. 
Priority-2: Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
Priority-3: The terraform.tfvars.json file, if present.
Priority-4: The terraform.tfvars file, if present.
Priority-5: Environment variables

Priority 1️⃣ --var and --var-file  
Priority 2️⃣ *.auto.tfvars  
Priority 3️⃣ terraform.tfvars  
Priority 4️⃣ Environment variables (TF_VAR_…)
Priority 5️⃣ Default values in variables.tf

# Comment machine_type in terraform.tfvars
machine_type  = "e2-micro"
```





