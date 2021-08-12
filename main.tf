resource "random_pet" "this" {
  count  = var.name != "" ? 0 : 1
  length = 2
}

resource "aws_instance" "this" {
  ami                    = var.ami
  vpc_security_group_ids = var.vpc_sgs
  instance_type          = var.instance_type
  tags                   = local.tags
}