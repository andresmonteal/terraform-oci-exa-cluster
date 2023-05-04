locals {
  defined_tags                    = data.oci_core_subnets.subnet.subnets[0].defined_tags
  subnet_id                       = data.oci_core_subnets.subnet.subnets[0].id
  backup_subnet_id                = data.oci_core_subnets.backup_subnet.subnets[0].id
  cloud_exadata_infrastructure_id = data.oci_database_cloud_exadata_infrastructures.exa_inf.cloud_exadata_infrastructures[0].id
  default_freeform_tags = {
    terraformed = "Please do not edit manually"
    module      = "oracle-terraform-oci-exa-cluster"
  }
  merged_freeform_tags = merge(var.freeform_tags, local.default_freeform_tags)
  # adds support for multi vm cluster and single cluster
  db_servers = var.db_node_storage_size_in_gbs == null ? null : compact(flatten([for db_server in data.oci_database_db_servers.db_servers.db_servers : db_server.id]))
}

# This resource provides the Cloud Vm Cluster resource in Oracle Cloud Infrastructure Database service.
resource "oci_database_cloud_vm_cluster" "main" {
  # Required
  backup_subnet_id                = local.backup_subnet_id
  cloud_exadata_infrastructure_id = local.cloud_exadata_infrastructure_id
  compartment_id                  = var.compartment_id
  cpu_core_count                  = var.cpu_core_count
  display_name                    = var.cluster_display_name
  gi_version                      = var.gi_version
  hostname                        = var.hostname
  ssh_public_keys                 = [trimspace(base64decode(data.oci_secrets_secretbundle.bundle[0].secret_bundle_content.0.content))] #var.ssh_public_keys == null ? [base64decode(data.oci_secrets_secretbundle.bundle[0].secret_bundle_content.0.content)] : var.ssh_public_keys
  subnet_id                       = local.subnet_id

  # Optional
  cluster_name                = var.cluster_name
  data_storage_percentage     = var.data_storage_percentage
  is_local_backup_enabled     = var.is_local_backup_enabled
  is_sparse_diskgroup_enabled = var.is_sparse_diskgroup_enabled
  license_model               = var.license_model
  memory_size_in_gbs          = var.memory_size_in_gbs
  data_storage_size_in_tbs    = var.data_storage_size_in_tbs
  db_node_storage_size_in_gbs = var.db_node_storage_size_in_gbs
  db_servers                  = local.db_servers
  ocpu_count                  = var.ocpu_count
  time_zone                   = var.time_zone
  scan_listener_port_tcp      = var.scan_listener_port_tcp

  # Tags
  defined_tags  = var.defined_tags
  freeform_tags = local.merged_freeform_tags

  # The timeouts block allows you to specify timeouts for certain operations, 12 hours is the default value
  timeouts {
    create = "12h"
    update = "12h"
    delete = "12h"
  }

  lifecycle {
    prevent_destroy = true
  }
}