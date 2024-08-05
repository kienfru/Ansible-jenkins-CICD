
//associate  route tables to subnets
resource "aws_route_table_association" "terrajens_pub_rta" {
    subnet_id = aws_subnet.test_public_subnet.id
    route_table_id = aws_route_table.public_rt.id
}

//associate  route tables to subnets
resource "aws_route_table_association" "terrajens_priv_rta" {
    subnet_id = aws_subnet.test_private_subnet.id
    route_table_id = aws_route_table.priv_rt.id
}