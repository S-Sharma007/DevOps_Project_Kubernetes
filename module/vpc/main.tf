resource "aws_vpc" "main" {
  # checkov:skip=CKV2_AWS_11: ADD its just demo application
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}


resource "aws_subnet" "public_subnet" {
  # checkov:skip=CKV_AWS_130: ADD its just demo application
    vpc_id     = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true
    
    tags = {
        Name = "subnet_public"
    }

}


resource "aws_subnet" "private_subnet" {
    vpc_id     = aws_vpc.main.id
    cidr_block = var.private_subnet_cidr
    availability_zone = var.availability_zone
    map_public_ip_on_launch = false
    
    tags = {
        Name = "subnet_private"
    }
  
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "var.vpc.cidr"
  
}
}
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = route_table.public_route_table.id
}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "var.vpc.cidr"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = route_table.private_route_table.id
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "IGW_Project_telementry"
  }
}
