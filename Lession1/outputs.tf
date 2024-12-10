# output "instance_ids" {
#   value = [for i in aws_instance.example : i.id]
# }

output "instance_ids" {
  value = aws_instance.terraform[*].id
  description = "List of instance IDs created by Terraform."
}
