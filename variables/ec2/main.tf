provider "aws" {
  region = var.aws_region
}

resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "my_key" {
  key_name   = var.key_name
  public_key = tls_private_key.my_key.public_key_openssh
}

resource "aws_instance" "my_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.my_key.key_name

  tags = {
    Name = "MyEC2Instance"
  }
}

resource "local_file" "private_key" {
  content         = tls_private_key.my_key.private_key_openssh
  filename        = "${path.module}/${var.private_key_filename}"
  file_permission = "0600"
}

output "instance_ip" {
  value = aws_instance.my_ec2.public_ip
}

output "key_download_path" {
  value = local_file.private_key.filename
}
