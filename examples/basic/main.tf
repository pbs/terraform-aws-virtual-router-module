module "mesh" {
  source = "github.com/pbs/terraform-aws-app-mesh-module?ref=0.0.1"

  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
}

module "router" {
  source = "../.."

  mesh_name = module.mesh.id

  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
}
