output "instance_ids" {
  value       = values(aws_instance.terraform)[*].id
  description = "List of instance IDs created by Terraform."
}
