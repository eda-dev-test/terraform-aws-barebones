variable "ami" {
  type        = string
  description = "The AMI id to use for this instance"
}

variable "vpc_sgs" {
  type        = list(string)
  description = "The sgs to associate to this instance (this will also determine the subnet the instance is deployed in)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The tags to apply to the instance"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "The size of the instance to spin up"
}

variable "name" {
  type        = string
  default     = ""
  description = "The name to be applied to the instance tags for this instance, if no name is provided, one will be created."
}

locals {
  name = coalescelist(var.name, random_pet.this[*].id)[0]
  tags = merge(
    var.tags,
    {
      "Note" : "you-should-not-have-used-this-terraform-module",
      "Module" : "erindatkinson/terraform-aws-barebones",
      "Name" : local.name
  })
}