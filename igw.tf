
//create an internet gateway for the vpc
resource "aws_internet_gateway" "terrajens_igw" {
    vpc_id = aws_vpc.test_vpc.id
    tags ={
        Name = "terrajens_igw"
    }
      
  
}
