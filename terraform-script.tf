
resource "aws_key_pair" "my-key" {
  key_name   = "saru-mumbai-keypair"
  public_key = file("saru-mumbai-keypair.pub")
}

resource "aws_instance" "my-instance" {
  instance_type = "t2.micro"
  ami           = var.AMIS[var.REGION]
  key_name      = aws_key_pair.my-key.key_name
  tags = {
    Name = "instance-2"
  }
  vpc_security_group_ids = [var.SECURITY_GRP]


  provisioner "file" {
    source      = "./app"
    destination = "./app"
  }
    provisioner "file" {
    source      = "web.sh"
    destination = "web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x web.sh",
      "./web.sh",
      "sudo docker compose up --build"
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