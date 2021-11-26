resource "aws_instance" "demo" {
    
    ami = "ami-04902260ca3d33422"
    instance_type = "t2.micro"

    vpc_security_group_ids = [aws_security_group.web-security.id]

    user_data =<<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemct l start httpd
                systemctl enable httpd 
                echo "You are learning terraform, Have a good day" > /var/www/index.html
                EOF 

        tags={
            Name = "Demo-simplewebserver"
        }
}