//create a complete aws vpc code
resource "aws_vpc" "test_vpc" {
    cidr_block = "150.0.0.0/16"
    instance_tenancy = "default" 
    tags = {
        Name = "test_vpc"
    }
}