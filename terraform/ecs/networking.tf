
#Create public subnet - LOOP
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.aws-vpc.id
  count = length(var.public_subnets)
  cidr_block = element(var.public_subnets, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "${var.app_name}-public-subnet-${count.index + 1}"
    Environment = var.app_environment
  }
}
#Create private subnet - LOOP
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.aws-vpc.id
    count = length(var.private_subnets)
    cidr_block = element(var.private_subnets, count.index)
    availability_zone = element(var.availability_zones, count.index)

    tags = {
      Name = "${var.app_name}-private-subnet-${count.index + 1}"
      Environment = var.app_environment
    }
}
#Create public subnet route table 
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.aws-vpc.id

  tags = {
    Name = "${var.app_name}-public-routing-table"
    Environment = var.app_environment
  }
}
#Associate the public subnet with public subnet route table - LOOP
resource "aws_route_table_association" "public" {
  count = length(var.public_subnets)
  subnet_id = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

#Create internet gateway and attached it to the VPC
resource "aws_internet_gateway" "aws-igw" {
  vpc_id = aws_vpc.aws-vpc.id
  tags = {
    Name = "${var.app_name}-igw"
    Environment = var.app_environment
  }
}

#Create NAT gateway and attach it to the subnet

#Add a route to the open internet by associate 0.0.0.0/0 cidr block to the internet gateway.
resource "aws_route" "public" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.aws-igw.id
}