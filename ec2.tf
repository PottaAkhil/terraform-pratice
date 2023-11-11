resource "aws_instance" "web" {
  ami           = "ami-067d1e60475437da2"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.kyc_app_public_key.key_name
  subnet_id        = aws_subnet.public.id
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
