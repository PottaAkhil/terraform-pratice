data "aws_ami_ids" "ubuntu" {
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami_ids.ubuntu.id
  instance_type = "t2.micro"
  count =var.number
  key_name      = aws_key_pair.kyc_app_public_key.key_name
  subnet_id     = aws_subnet.public[count.index].id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_type = "gp2"
    volume_size = 40
  }
  tags = {
    Name = "terraform-ec2"
  }
 }
