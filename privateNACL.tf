//create a private NACL
resource "aws_network_acl" "terrajens_priv_nacl" {
    vpc_id = aws_vpc.test_vpc.id

 egress {
    protocol   = "all"
    rule_no = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no = 100
    action     = "allow"
    cidr_block = "150.0.0.0/16"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "jerrajens_priv_nacl"
  }
}   
  
/*inbound rule: from within VPC ONLY
outbound rule: to internet using all ports
*/
