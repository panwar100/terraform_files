provider "aws" {
    region = "us-east-1" # Replace with your desired region
}

resource "aws_key_pair" "key1" {
    key_name   = "key1-new" # Replace with your existing key name
    public_key = file("/home/panwar/Downloads/key1.pub") # Replace with the path to your public key
}

resource "aws_instance" "terrafrom" {
    ami           = "ami-0fc5d935ebf8bc3bc" # Replace with your desired AMI ID
    instance_type = "t2.micro"

    key_name = aws_key_pair.key1.key_name

    tags = {
        Name = "terraformInstance"
    }
}