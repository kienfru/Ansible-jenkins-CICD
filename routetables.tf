
//create a public rt
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.test_vpc.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.terrajens_igw.id
    }

        tags = {
            Name = "public_rt"
        }
    }
  



//create a private rt
resource "aws_route_table" "priv_rt" {
    vpc_id = aws_vpc.test_vpc.id

    route  {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.terrajens_natgw.id
    }

        tags = {
            Name = "priv_rt"
        }
    }
  