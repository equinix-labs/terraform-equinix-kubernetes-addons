locals {
  kubeconfig_cmd = length(var.addon_context.kubeconfig_remote_path) > 0 ? "kubectl --kubeconfig=${var.addon_context.kubeconfig_remote_path}" : "kubectl"
}

data "cloudinit_config" "prerequisites" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content      = <<-EOT
      write_files:
      - path: /etc/default/kubelet
        content: |
          KUBELET_EXTRA_ARGS="--cloud-provider=external"
        append: true
    EOT
  }
}

resource "null_resource" "install_cloud_provider_equinix_metal" {
  triggers = {
    user           = var.ssh_config.user
    private_key    = var.ssh_config.private_key
    host           = var.ssh_config.host
    kubeconfig_cmd = local.kubeconfig_cmd
    version        = var.addon_config.version
    secret_keys    = join(",", keys(var.addon_config.secret))
    secret_values  = join(",", values(var.addon_config.secret))
  }

  connection {
    type        = "ssh"
    user        = var.ssh_config.user
    private_key = var.ssh_config.private_key
    host        = var.ssh_config.host
  }

  provisioner "file" {
    destination = "/tmp/metal-cloud-config.yaml"
    content = templatefile("${path.module}/templates/metal-cloud-config.yaml.tftpl", {
      secret = var.addon_config.secret
    })
  }

  provisioner "remote-exec" {
    inline = [
      "${local.kubeconfig_cmd} apply -f /tmp/metal-cloud-config.yaml"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "URL='https://github.com/equinix/cloud-provider-equinix-metal/releases/download/${var.addon_config.version}/deployment.yaml'",
      "${local.kubeconfig_cmd} apply -f $URL"
    ]
  }
}
