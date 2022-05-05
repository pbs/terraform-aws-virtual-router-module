locals {
  name    = var.name != null ? var.name : var.product
  creator = "terraform"

  tags = merge(
    var.tags,
    {
      Name                                      = local.name
      "${var.organization}:billing:product"     = var.product
      "${var.organization}:billing:environment" = var.environment
      creator                                   = local.creator
      provisioner                               = data.aws_caller_identity.current.user_id
      repo                                      = var.repo
    }
  )
}
