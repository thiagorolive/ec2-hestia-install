data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.server.id
  allocation_id = aws_eip.server.id
}
resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  user_data     = file("scripts/init_script.sh")

  tags = {
    name        = var.name
    environment = var.env
    provisioner = "terraform"

  }

}
resource "aws_eip" "server" {
  vpc = true
}