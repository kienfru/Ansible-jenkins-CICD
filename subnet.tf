
//create a public subnet
resource "aws_subnet" "test_public_subnet" {
    vpc_id = aws_vpc.test_vpc.id
    cidr_block = "150.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags = { 
        Name = "test_public_subnet"
    }
}

//create a private subnet
resource "aws_subnet" "test_private_subnet" {
   vpc_id = aws_vpc.test_vpc.id
    cidr_block = "150.0.2.0/24"
    availability_zone = "us-east-1b"

    tags = { 
        Name = "test_private"
    }  
}
    

