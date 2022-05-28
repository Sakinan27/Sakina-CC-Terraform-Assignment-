terraform {
    backend "s3"{
        bucket = "my-sakina-test-bucket-cc2022-onsite-34"
        key = "terraform-state.state"
        region ="us-east-1"
    }
}




resource "aws_instance" "web_server" {
  ami          = "ami-06eecef118bbf9259"
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_name
  }
}


resource "aws_s3_bucket" "main_s3_bucket" {
  bucket = "my-sakina-test-bucket-cc2022-onsite-34"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}