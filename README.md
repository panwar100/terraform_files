# 🚀 Terraform AWS Infrastructure Modules

This repository contains modular and reusable Terraform configurations to provision AWS infrastructure resources such as **EC2 instances** and **S3 buckets**, along with variable modules for flexibility.

---

## 📁 Repository Structure

| Module Path                 | Description                              | Last Commit             |
|-----------------------------|------------------------------------------|--------------------------|
| `ec2/ec2_with_key/`         | Launch EC2 instance using existing SSH key | Create ec2_with_key      |
| `ec2/ec2_without_key/`      | Auto-generate key pair and launch EC2     | Create ec2_without_key   |
| `s3/s3_public/`             | Create a **public** S3 bucket              | Create s3_public         |
| `s3/s3_private/`            | Create a **private** S3 bucket             | Create s3_private        |
| `variables/ec2/`           | Variable definitions for EC2 modules      | Add files via upload     |
| `variables/s3/`            | Variable definitions for S3 modules       | Add files via upload     |

---

## 🧰 Prerequisites

- AWS CLI configured with IAM credentials  
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) installed  
- SSH key for `ec2_with_key` module (or let `ec2_without_key` generate one)

---

## ⚙️ Terraform Commands (All Modules)

| Command             | Description                                      |
|---------------------|--------------------------------------------------|
| `terraform init`    | Initialize Terraform and download providers      |
| `terraform plan`    | Preview changes before applying                  |
| `terraform apply`   | Provision AWS infrastructure                     |
| `terraform destroy` | Tear down resources created by Terraform         |
| `terraform output`  | Show output values defined in the configuration  |

---

## 📦 EC2 Modules

### 🔐 `ec2/ec2_with_key/`

- Uses your **existing public key** file.
- Creates an EC2 instance with key association.

```bash
cd ec2/ec2_with_key
terraform init
terraform plan
terraform apply
```
✅ Ensure the public key file path in aws_key_pair is correctly set.

### 🔐` ec2/ec2_without_key/`
- Automatically generates a 4096-bit RSA key pair

- Saves private key locally (`my-key.pem`)

- Registers public key with AWS and launches EC2

```bash
cd ec2/ec2_without_key
terraform init
terraform plan
terraform apply
```
📝 Outputs:

- Public IP of EC2

- Path to downloaded private key

## 🪣 S3 Modules

🌐` s3/s3_public/`
- Creates a publicly accessible S3 bucket

- Useful for hosting static content or public assets

```bash
cd s3/s3_public
terraform init
terraform plan
terraform apply
```
⚠️ Review bucket policy to avoid accidental data exposure.

### 🔐 `s3/s3_private/`
- Creates a private S3 bucket

- Ideal for internal logs, backups, or secure assets

```bash
cd s3/s3_private
terraform init
terraform plan
terraform apply
```
## 📂 Variable Modules
Reusable variable definitions to keep your Terraform DRY and modular.

📌 `variables/ec2/`
Stores input variables for EC2 modules

Rename `varaibles.tf `to `variables.tf`for clarity

```bash
module "ec2_vars" {
  source = "../variables/ec2"
}
```
📌 `variables/s3/`
Input variables for both public and private S3 modules

```bash
module "s3_vars" {
  source = "../variables/s3"
}
```
## 🧼 Recommended .gitignore 
```bash
# Terraform-related
*.tfstate
*.tfstate.*
.terraform/
*.tfvars
*.pem
```
