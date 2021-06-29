provider "aws" {
    region="us-east-1"
}

variable "ami_id"{
    default = "ami-0742b4e673072066f"
    description = "AMI Id for ec2 instance"
    type = string
}
variable "ec2_tags"{
    default =["santhra-web","santhra-app"]
}
resource "aws_instance" "myec2"{
    ami = var.ami_id
    count = 2
    instance_type = "t2.micro"  

    tags={
        "Name" = var.ec2_tags[count.index]
    } 
}
output "myec2_instance_ip_1"{
    value = aws_instance.myec2[1].public_ip
}

output "myec2_private_ip_forall"{
    value = aws_instance.myec2[*].private_ip
}