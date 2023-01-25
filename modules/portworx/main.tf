locals {
  mydata = zipmap(var.portworx_config.ssh.host, var.portworx_config.ssh.worker_addresses)
  ndata  = join(" ", [for key, value in local.mydata : "${key},${value}"])
}


data "template_file" "config_vars" {
  template = file("${path.module}/templates/cluster-config-vars.template")
  vars = {
    XX_HOST_IPS_XX     = local.ndata
    XX_SSH_USER_XX     = var.portworx_config.ssh_user
    XX_KSVER_XX        = var.portworx_config.kubespray_version
    XX_K8SVER_XX       = var.portworx_config.k8s_version
    XX_PXOP_XX         = var.portworx_config.px_operator_version
    XX_PXSTG_XX        = var.portworx_config.px_stg_version
    XX_CPH_XX          = var.portworx_config.cp_node_count
    XX_CLUSTER_NAME_XX = var.portworx_config.cluster_name
    XX_PX_SECURITY_XX  = var.portworx_config.px_security
  }
}

resource "local_sensitive_file" "cluster_config_vars" {
  content  = data.template_file.config_vars.rendered
  filename = "${path.root}/cluster-config-vars"
}

resource "local_sensitive_file" "varsfile" {
  content  = templatefile("${path.module}/templates/vars.tftpl", { KUBE_CONF = var.kubeconfig_local_path, PX_CLUSTER_NAME = var.portworx_config.cluster_name, PX_KUBE_CONTROL_HOSTS = var.portworx_config.cp_node_count, PX_K8S_VERSION = var.portworx_config.k8s_version })
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
  count = length(var.portworx_config.ssh.worker_addresses)

  connection {
    type        = "ssh"
    user        = var.portworx_config.ssh.user
    private_key = file(var.portworx_config.ssh.private_key)
    host        = var.portworx_config.ssh.worker_addresses[count.index]
  }

  provisioner "file" {
    source      = "${path.module}/scripts/setup_disks.sh"
    destination = "/tmp/setup_disks.sh"

  }
  provisioner "remote-exec" {
    inline = [
      "bash /tmp/setup_disks.sh create"
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
       ./scripts/install-portworx.sh
     EOT
    interpreter = ["/bin/bash", "-c"]
    working_dir = path.module
  }
  provisioner "local-exec" {
    when        = destroy
    command     = <<-EOT
       echo "Deleting Portworx cluster. It will take several minutes."
       ./scripts/remove-portworx.sh
     EOT
    interpreter = ["/bin/bash", "-c"]
    working_dir = path.module
  }
}
