## 🌍 Terraform Overview

Terraform by HashiCorp is an Infrastructure as Code (IaC) tool that enables you to provision, manage, and version cloud infrastructure using a declarative language (HCL – HashiCorp Configuration Language).

---

## 🧱 Core Terraform Components Explained

### 1️⃣ `variable` – Input Configuration

Variables are used to **pass dynamic values** into your configuration. This makes your code reusable and configurable for different environments (dev, test, prod, etc.).

```hcl
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}
```
You access it using:
```hcl
provider "aws" {
  region = var.region
}
```
---

### 2️⃣ `sets` – Unique Unordered List
A set is a collection of unique values with no particular order. It prevents duplication and is useful when order doesn't matter (like availability zones).

```hcl
variable "azs" {
  type = set(string)
  default = ["us-east-1a", "us-east-1b"]
}
```
Terraform ensures values are unique.

---

### 3️⃣ `map` – Key-Value Pairs
A map allows you to define dynamic lookups using keys. It's useful for selecting values based on a condition like a region or environment.

```hcl
variable "instance_amis" {
  type = map(string)
  default = {
    us-east-1 = "ami-0c55b159cbfafe1f0"
    us-west-2 = "ami-0a91cd140a1fc148a"
  }
}
```
Usage:

```hcl
ami = var.instance_amis[var.region]
```

---

### 4️⃣ `object` – Structured Complex Data
An object is used to group multiple named attributes together into a single variable. It’s ideal for configs like database settings or tagging conventions.

```hcl
variable "db_config" {
  type = object({
    engine         = string
    engine_version = string
    instance_class = string
  })

  default = {
    engine         = "mysql"
    engine_version = "8.0"
    instance_class = "db.t3.micro"
  }
}
```
Usage:

```hcl
resource "aws_db_instance" "example" {
  engine         = var.db_config.engine
  engine_version = var.db_config.engine_version
  instance_class = var.db_config.instance_class
}
```
---

### 5️⃣ `module` – Reusable Terraform Code
Modules are containers for reusable Terraform configurations. They let you organize code logically (e.g., separate modules for VPC, EC2, RDS).

```hcl
module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  azs        = var.azs
}
```
You can create a module once and call it with different inputs as needed.

--- 

### 🚀 Why Use These Components?
variable: Makes code dynamic and flexible.

set: Ensures uniqueness in lists (e.g., AZs, ports).

map: Easily manage environment- or region-specific values.

object: Organize related settings into structured data.

module: Encapsulate logic, reduce repetition, and improve code reusability.
