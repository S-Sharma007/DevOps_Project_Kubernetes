variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "kubernetes version"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string

}

variable "subnet_ids" {
  description = "The subnet IDs"
  type        = list(string)
}

variable "node_groups" {
  description = "EKS node group Configuration"
  type = map(object({
    capacity_type    = string
    instance_type    = list(string)
    desired_capacity = number
    min_size         = number
    max_size         = number
  }))
}