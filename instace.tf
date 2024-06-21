resource "aws_key_pair" "dove-key" {
  key_name   = "dovekey"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "dove-web" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.dove-pub-1.id
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = [aws_security_group.dove-stack-sg.id]
  tags = {
    Name = "my-dove-web"
  }
}

output "PublicIP" {
  value = aws_instance.dove-web.public_ip
}

resource "aws_ebs_volume" "vol_4_dove" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    "Name" = "extr-vol-4-dove"
  }

}
resource "aws_volume_attachment" "attach_volume" {
  device_name = "/dev/xvdh"
  instance_id = aws_instance.dove-web.id
  volume_id   = aws_ebs_volume.vol_4_dove.id

}

/* provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    type        = "ssh"
    user        = var.USER
    private_key = file("dovekey")
    host        = self.public_ip
  }

  # Ensure the instance has a public IP
  associate_public_ip_address = true ### */