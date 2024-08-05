
//create a private instance
resource "aws_instance" "terrajens_priv_inst" {
    ami = "ami-04a81a99f5ec58529"
    instance_type = "t2.micro"
    key_name = "demo"
    subnet_id = aws_subnet.test_private_subnet.id
    security_groups = [aws_security_group.terrajens_sg.id]

    tags = {
      Name = "terrajens_priv_inst"
    }
  
}