
resource "aws_instance" "my-instance" {
  instance_type           = "t2.micro"
  ami                     = var.AMIS[var.REGION]
  key_name                = "saru-mumbai-keypair"
  tags = {
    Name = "instance-5"
  }
  vpc_security_group_ids  = [var.SECURITY_GRP]




  provisioner "file"{
    source = "web.sh"
    destination = "web.sh"
  }

  provisioner "remote-exec" {
    inline = [
       "sudo chmod 777 web.sh",
       "./web.sh"
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