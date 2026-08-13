variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "sre-platform-prod"
}

variable "vpc_cidr" {
  description = "VPC CIDR for production"
  type        = string
  default     = "10.2.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "Public subnet 1 CIDR for production"
  type        = string
  default     = "10.2.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "Public subnet 2 CIDR for production"
  type        = string
  default     = "10.2.2.0/24"
}