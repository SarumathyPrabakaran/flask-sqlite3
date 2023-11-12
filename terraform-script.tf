
resource "aws_instance" "my-instance" {
  instance_type           = "t2.micro"
  ami                     = var.AMIS[var.REGION]
  key_name                = "saru-mumbai-keypair"
  tags = {
    Name = "instance-5"
  }
  vpc_security_group_ids  = [var.SECURITY_GRP]
  user_data               = file("web.sh")  # Include the contents of your web.sh script



  provisioner "remote-exec" {
    inline = [
      "sudo docker-compose up --build"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("saru-mumbai-keypair")
    host        = self.public_ip
  }

}

output "PublicIp" {
    value = aws_instance.my-instance.public_ip
}

output "PrivateIp" {
    value = aws_instance.my-instance.private_ip
}