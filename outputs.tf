output "name" {
  description = "Name of the virtual router"
  value       = aws_appmesh_virtual_router.router.name
}

output "arn" {
  description = "ARN of the virtual router"
  value       = aws_appmesh_virtual_router.router.arn
}
