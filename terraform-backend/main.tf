provider "aws" {
  region = "us-east-1"  # Change as needed
}

# Create an ECR repository for the backend
resource "aws_ecr_repository" "backend_repo" {
  name = "backend-repo"
}

# Create an EKS Cluster
resource "aws_eks_cluster" "backend_cluster" {
  name     = "backend-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = aws_subnet.backend_subnet.*.id
  }
}

# IAM Role for EKS Cluster
resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

# Create Subnets
resource "aws_subnet" "backend_subnet" {
  count = 2
  vpc_id     = aws_vpc.backend_vpc.id
  cidr_block = "10.0.${count.index + 1}.0/24"
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
}

# VPC
resource "aws_vpc" "backend_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Output the ECR URL
output "backend_ecr_url" {
  value = aws_ecr_repository.backend_repo.repository_url
}
