output "nginx_ireland_ips" {
  value = [
    aws_instance.ec2_1.public_ip,
    aws_instance.ec2_2.public_ip
  ]
}

output "nginx_london_ips" {
  value = [
    aws_instance.ec2_4.public_ip,
    aws_instance.ec2_5.public_ip
  ]
}

output "flask_private_ip" {
  value = aws_instance.ec2_3.private_ip
}
