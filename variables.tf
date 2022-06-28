#Variables for Network Resources

variable "vpc_tag_name" {
  type        = string
  default = "ns_vpc"
  description = "Name tag for the VPC"
}

variable "route_table_tag_name" {
  type        = string
  default     = "main"
  description = "Route table description"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block range for vpc"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
  description = "CIDR block range for the private subnet"
}

variable "public_subnet_cidr_blocks" {
  type = list(string)
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
  description = "CIDR block range for the public subnet"
}

variable "private_subnet_tag_name" {
  type        = string
  default = "Custom Kubernetes cluster private subnet"
  description = "Name tag for the private subnet"
}

variable "public_subnet_tag_name" {
  type        = string
  default = "Custom Kubernetes cluster public subnet"
  description = "Name tag for the public subnet"
}

variable "availability_zones" {
  type  = list(string)
  default = ["us-west-2a", "us-west-2b"]
  description = "List of availability zones for the selected region"
}

variable "region" {
  description = "aws region to deploy to"
  default = "us-west-2"
  type        = string
}

#############################################################################

#Variables for EKS Resources

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  default = "ns_cluster"
  type = string
}

variable "node_group_name" {
  description = "Name of the Node Group"
  default = "ns_node_group"
  type = string
}


variable "endpoint_private_access" {
  type = bool
  default = true
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
}

variable "endpoint_public_access" {
  type = bool
  default = true
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
}

variable "eks_cluster_subnet_ids" {
  type = list(string)
  default = ["subnet-0b6c0a62928e3059a", "subnet-057dfda873265f141"]
  description = "List of subnet IDs. Must be in at least two different availability zones. Amazon EKS creates cross-account elastic network interfaces in these subnets to allow communication between your worker nodes and the Kubernetes control plane."
}

variable "private_subnet_ids" {
  type = list(string)
  default = ["subnet-0b6c0a62928e3059a"]
  description = "List of private subnet IDs."
}

variable "public_subnet_ids" {
  type = list(string)
  default = ["subnet-057dfda873265f141"]
  description = "List of public subnet IDs."
}

variable "ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Defaults to AL2_x86_64. Valid values: AL2_x86_64, AL2_x86_64_GPU."
  type = string 
  default = "AL2_x86_64"
}

variable "disk_size" {
  description = "Disk size in GiB for worker nodes. Defaults to 20."
  type = number
  default = 20
}

variable "instance_types" {
  type = list(string)
  default = ["t3.medium"]
  description = "Set of instance types associated with the EKS Node Group."
}

variable "pvt_desired_size" {
  description = "Desired number of worker nodes in private subnet"
  default = 1
  type = number
}

variable "pvt_max_size" {
  description = "Maximum number of worker nodes in private subnet."
  default = 1
  type = number
}

variable "pvt_min_size" {
  description = "Minimum number of worker nodes in private subnet."
  default = 1
  type = number
}

variable "pblc_desired_size" {
  description = "Desired number of worker nodes in public subnet"
  default = 1
  type = number
}

variable "pblc_max_size" {
  description = "Maximum number of worker nodes in public subnet."
  default = 1
  type = number
}

variable "pblc_min_size" {
  description = "Minimum number of worker nodes in public subnet."
  default = 1
  type = number
}

variable cluster_sg_name {
  description = "Name of the EKS cluster Security Group"
  default = "new_security_group"
  type        = string
}

variable nodes_sg_name {
  description = "Name of the EKS node group Security Group"
  default = "new_node_group_security"
  type        = string
}

variable vpc_id {
  description = "VPC ID from which belongs the subnets"
  default = "vpc-003ed52cec708bcbf"
  type        = string
  
  
}
