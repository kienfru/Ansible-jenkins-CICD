
//create a public NACL
resource "aws_network_acl" "terrajens_pub_nacl" {
  vpc_id = aws_vpc.test_vpc.id

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

ingress {
    protocol   = "tcp"
    rule_no = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8080
    to_port    = 8080
  }

  tags = {
    Name = "terrajens_pub_nacl"
  }
}
/*inbound rule: from internet using port 22 ONLY
outbound rule: to internet using all ports
*/

