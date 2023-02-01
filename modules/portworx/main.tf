resource "local_sensitive_file" "varsfile" {
  content  = templatefile("${path.module}/templates/vars.tftpl", { KUBE_CONF = var.addon_context.kubeconfig_local_path })
  filename = "${path.root}/vars"
}

resource "local_sensitive_file" "px_operator" {
  content  = templatefile("${path.module}/templates/px-operator.tftpl", { pxop_ver = var.portworx_config.px_operator_version })
  filename = "${path.root}/px-operator.yml"
}


resource "local_sensitive_file" "storage_cluster" {
  content  = templatefile("${path.module}/templates/storage-cluster.tftpl", { kvdb_device = "/dev/pwx_vg/pwxkvdb", px_stg_ver = var.portworx_config.px_stg_version, px_sec = var.portworx_config.px_security })
  filename = "${path.root}/storage-cluster.yml"
}

resource "null_resource" "setup_disks" {
  for_each = { for i, node in var.portworx_config.worker_nodes: node.ip => node }
  depends_on = [
    local_sensitive_file.varsfile,
    local_sensitive_file.px_operator,
    local_sensitive_file.storage_cluster
  ]
  
  connection {
    type        = "ssh"
    user        = each.value.user
    private_key = file(each.value.private_key_path)
    host        = each.key
  }

  provisioner "file" {
    source      = "${path.module}/scripts/setup_disks.sh"
    destination = "/tmp/setup_disks.sh"

  }
  provisioner "remote-exec" {
    inline = [
      "bash /tmp/setup_disks.sh"
    ]
  }
}

resource "null_resource" "portworx_setup" {
  depends_on = [
    null_resource.setup_disks
  ]

  provisioner "local-exec" {
    command     = <<-EOT
       echo "Setting up Portworx cluster. It will take several minutes."
       ./${path.module}/scripts/install-portworx.sh
     EOT
    interpreter = ["/bin/bash", "-c"]
    working_dir = path.root
  }
  provisioner "local-exec" {
    when        = destroy
    command     = <<-EOT
       echo "Deleting Portworx cluster. It will take several minutes."
       ./${path.module}/scripts/remove-portworx.sh
     EOT
    interpreter = ["/bin/bash", "-c"]
    working_dir = path.root
  }
}

data "external" "get_px_data" {
  depends_on = [null_resource.portworx_setup]
  program    = ["sh", "-c", "kubectl --kubeconfig ${var.addon_context.kubeconfig_local_path} get storagecluster -n portworx --no-headers -o jsonpath='{\"{\"}\"cluster_id\": \"{.items[0].metadata.uid}\", \"cluster_name\": \"{.items[0].metadata.name}\"}' "]
}
