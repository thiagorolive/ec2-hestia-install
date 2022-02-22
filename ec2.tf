# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }
#   owners = ["099720109477"]
# }

# resource "aws_instance" "server" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type
#   user_data     = <<-EOH
#       #!/bin/bash
#       apt-get update
#       apt-get install apache2 -y
#       systemctl start apache2
#       systemctl enable apache2
#       echo -e "<h1>Deployed by terraform</h1>\nO IP interno do seu host esta funcionando em $(hostname)" > /var/www/html/index.html
#     EOH

#   tags = {
#     name        = var.name
#     environment = var.env
#     provisioner = "terraform"

#   }

# }