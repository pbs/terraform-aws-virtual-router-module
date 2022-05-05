resource "aws_appmesh_virtual_router" "router" {
  name      = local.name
  mesh_name = var.mesh_name

  spec {
    listener {
      port_mapping {
        port     = var.port
        protocol = var.protocol
      }
    }
  }

  tags = local.tags
}
