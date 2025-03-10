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
  description = "Map of node group definitions"
  type = map(object({
    desired_capacity = number
    max_size         = number
    min_size         = number
    instance_type    = string
  }))
}