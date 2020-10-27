
/**
* Main terraform script
*/

# EC2 Instance
 resource "aws_instance" "example" {
     ami = "ami-06fd8a495a537da8b" # ubuntu Server 20.04 LTS
     instance_type = "t2.micro"

     tags = {
      Name = "ec2-example"
     }

     vpc_security_group_ids = [aws_security_group.instance.id]
     user_data = <<-EOF
               #!/bin/bash
               echo "Hello, World" > index.html
               nohup busybox httpd -f -p "${var.server_port}" &
               EOF
 }

# Security Group 
resource "aws_security_group" "instance" {
    name = "example_sg"

    ingress {
        from_port   = var.server_port
        to_port     = var.server_port
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    lifecycle {
        create_before_destroy = true
    }
}

# Launch Configurations (Cluster) 
//resource "aws_launch_configuration" "example" {
//    image_id = "ami-08d658f84a6d84a80"
//    instance_type = "t2.micro"
//    security_groups = [aws_security_group.instance.id]
//
//    user_data = <<-EOF
//              #!/bin/bash
//              echo "Hello, World" > index.html
//              nohup busybox httpd -f -p "${var.server_port}" &
//              EOF
//
//    lifecycle {
//        create_before_destroy = true
//    }
//}

//data "aws_availability_zones" "all" {}

# auto scaling
//resource "aws_autoscaling_group" "example" {
//
//    launch_configuration = "${aws_launch_configuration.example.id}"
//    availability_zones = ["${data.aws_availability_zones.all.names}"]
//
//    min_size = 2
//    max_size = 10
//
//    load_balancers = ["${aws_elb.example.name}"]
//    health_check_type = "ELB"
//
//    tag {
//        key = "Name"
//        value = "terraform-asg-example"
//        propagate_at_launch = true
//    }
//}

# Load Balancer
//resource "aws_elb" "example" {
//    name                = "terraform-asg-example"
//    security_groups     = ["${aws_security_group.elb.id}"]
//    availability_zones  = ["${data.aws_availability_zones.all.names}"]
//
//    health_check {
//        healthy_threshold = 2
//        unhealthy_threshold = 2
//        timeout = 3
//        interval = 30
//        target = "HTTP:${var.server_port}/"
//    }
//
//    listener {
//        lb_port           = 80
//        lb_protocol       = "http"
//        instance_port     = "${var.server_port}"
//        instance_protocol = "http"
//    }
//}

//resource "aws_security_group" "elb" {
//    name = "terraform-example-elb"
//
//    egress {
//        from_port = 0
//        to_port = 0
//        protocol = "-1"
//        cidr_blocks = ["0.0.0.0/0"]
//    }
//
//    ingress {
//        from_port = 80
//        to_port = 80
//        protocol = "tcp"
//        cidr_blocks = ["0.0.0.0/0"]
//    }
//}
