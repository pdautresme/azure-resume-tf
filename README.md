# Azure Resume Terraform Project

This Terraform project deploys the infrastructure for an Azure-based resume website. It includes resources for storage and a Cosmos DB database to host and manage the resume data.

## Project Structure

- `main.tf`: Main Terraform configuration file defining the core resources.
- `variables.tf`: Input variables for the Terraform configuration.
- `outputs.tf`: Output values from the Terraform deployment.
- `providers.tf`: Provider configurations for Azure.
- `terraform.tfvars`: Variable values file (not committed to version control).
- `modules/database/`: Module for Cosmos DB configuration.
- `modules/storage/`: Module for Azure Storage configuration.
- `main.tfplan` and `main.destroy.tfplan`: Terraform plan files for apply and destroy operations.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (version 1.0 or later recommended)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and authenticated
- Azure subscription with appropriate permissions

## Setup

1. Clone this repository:
   ```
   git clone <repository-url>
   cd azure-resume-tf
   ```

2. Authenticate with Azure:
   ```
   az login
   ```

3. Initialize Terraform:
   ```
   terraform init
   ```

4. Update `terraform.tfvars` with your specific values (e.g., resource group name, location).

## Usage

1. Plan the deployment:
   ```
   terraform plan -out=main.tfplan
   ```

2. Apply the plan:
   ```
   terraform apply main.tfplan
   ```

3. To destroy the resources:
   ```
   terraform plan -destroy -out=main.destroy.tfplan
   terraform apply main.destroy.tfplan
   ```

## Modules

- **Database Module** (`modules/database/`): Configures Azure Cosmos DB for storing resume data.
- **Storage Module** (`modules/storage/`): Sets up Azure Storage for hosting static website files.

## Outputs

After deployment, Terraform will output important information such as:
- Storage account details
- Cosmos DB endpoint and keys
- Website URL

Refer to `outputs.tf` for the complete list.

## Troubleshooting

- Ensure your Azure subscription has sufficient quotas for the resources being deployed.
- Check Terraform and Azure CLI versions if you encounter compatibility issues.
- Review Azure activity logs for deployment errors.

## Contributing

Please follow standard Terraform best practices. Test changes in a development environment before applying to production.

## License

This project is licensed under the MIT License.