
//create a NAT gateway
resource "aws_eip" "terrajens_eip" {
tags = {
  Name = "terrajens_natgw_eip"

  }  
}

//associate nat to eip
resource "aws_nat_gateway" "terrajens_natgw" {
    allocation_id =  aws_eip.terrajens_eip.id
    subnet_id =   aws_subnet.test_public_subnet.id

    tags = {
      Name ="terrajens_natgw"
    }
}

