data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  user_data     = <<-EOH
      #!/bin/bash
      apt-get update
      apt-get upgrade -y
      wget https://raw.githubusercontent.com/hestiacp/hestiacp/release/install/hst-install.sh
      sudo bash hst-install.sh --apache yes --phpfpm yes --multiphp no --vsftpd no --proftpd no --named no --mysql yes --postgresql no --exim no --dovecot no --sieve no --clamav no --spamassassin no --iptables yes --fail2ban yes --quota no --api yes --interactive no --with-debs no  --port 8083 --hostname control.test.com --email test@test.com --password 123321 --lang pt-br  --force
    EOH

  tags = {
    name        = var.name
    environment = var.env
    provisioner = "terraform"

  }

}