# SAKINA CODE
1. Open Visual Studio Editor
2. In terminal 
~/.aws/credentials


3. In Text Editor –  paste the Credentials 
Copy the configuration from AWS – go to AWS CLI:
[default]
aws_access_key_id=ASIAV4ICCXFK3L6I7JMB
aws_secret_access_key=DJu+6ylVufyKbMnUiRblThkjp+sjEb8Niv7pxSVu
aws_session_token=FwoGZXIvYXdzEO7//////////wEaDKeeeCo4wHFpT3f4ACLRAcskkTQPUgcJfbEVMhmjLBxeGlwSku+rkeR/fmYlBEI3oSTj1FG9bg3MF1H/dF10DhESa03/MN5qduxO/6h0Bx1ELiJs28Fk26Ycbu5uoskBLxJ61hfz241V+BdnFDgLdEcmCoATm3Y6u8DmZK2u+UHybbv39xOmodmGMnPDLvsCpl5qOw8SNkJky2VnewaaveTF7302it2gNnIvgXfJ2a88EgUgxRwKTiaJUMesRmfqJpmMOctVTHjtMP8eJF7nhNtFXFxXTSG7lltBfzQzFF0HKOXfxJQGMi2PiqvgN4PaKmJb9aqQkKLvH6jmmGCMFxYEdOJCqOX+IE+FDOw6OXa0Y/x/7HE=



4. USING TERRAFORM, CREATING A FILE WITH EXTENSION tf
code main.tf
code variable.tf
code output.tf


5. Then we use the following commands explained below
aws s3 ls
•	terraform init - Initialize prepares the working directory so Terraform can run the configuration.
•	terraform plan - Plan enables you to preview any changes before you apply them.
•	terraform apply - Apply makes the changes defined by your Terraform configuration to create, update, or destroy resources.


6. TO CREATE EC2 INSTANCE IN AWS THROUGH TERRAFORM (EC2 is the virtual computer/ website you are using on the 2 instance --Virtual Webserver)
resource "aws_instance" "web_server" {
  ami          = "ami-06eecef118bbf9259"
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_name
  }
}

NOTE -- We got the ami by going to Instance – Launch instance – copy from Amazon Linux 2 AMI (HVM) - Kernel 4.14, SSD Volume Type since we are using old version



7. VARIABLE.tf
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance2"
}

8. TO PASS THE VARIABLE AS INPUT USING COMMAND LINE
terraform apply -var="instance_name=Saki_instance"


9. TO CREATE S3 BUCKET USING TERRAFORM – (S3 is the storage on AWS)
resource "aws_s3_bucket" "main_s3_bucket" {
  bucket = "my-sakina-test-bucket-cc2022-onsite-34"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


10. TO CHANGE THE LOCATION OF STATE FILE FROM LOCAL TO S3
terraform {
backend "s3"{
bucket = "terraform-state-storing-bucket"
key = "terraform-state.state"
region ="us-east-1"
}
}


