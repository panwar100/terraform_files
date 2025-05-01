provider "aws" {
  region = "us-east-1"
}

# 1. Generate a new SSH key pair
resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# 2. Register the public key with AWS
resource "aws_key_pair" "my_key" {
  key_name   = "my-key"
  public_key = tls_private_key.my_key.public_key_openssh
}

# 3. Create an EC2 instance using the key
resource "aws_instance" "my_ec2" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (update if needed)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name

  tags = {
    Name = "MyEC2Instance"
  }
}

# 4. Save the private key locally as my-key.pem
resource "local_file" "private_key" {
  content  = tls_private_key.my_key.private_key_openssh
  filename = "${path.module}/my-key.pem"
  file_permission = "0600"
}

# 5. Output instance IP and key location
output "instance_ip" {
  value = aws_instance.my_ec2.public_ip
}

output "key_download_path" {
  value = local_file.private_key.filename
}
