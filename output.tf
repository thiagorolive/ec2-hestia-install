output "public_ip" {
  value = aws_instance.server.public_ip
}

output "private_ip" {
  value = aws_instance.server.private_ip
}