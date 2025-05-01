variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default  = "us-east-1"

}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "my-key"

}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0fc5d935ebf8bc3bc" # Replace with your desired AMI ID
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro" # Replace with your desired instance
}

variable "private_key_filename" {
  description = "Filename to save the private key"
  type        = string
  default     = "my_key.pem" # Replace with your desired filename
}
