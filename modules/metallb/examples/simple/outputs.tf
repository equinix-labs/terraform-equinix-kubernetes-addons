output "terraform_equinix_kubernetes_addons" {
  description = "Equinix kubernetes addons - MetaLB outputs"
  value       = module.terraform_equinix_kubernetes_addons.metallb
}
