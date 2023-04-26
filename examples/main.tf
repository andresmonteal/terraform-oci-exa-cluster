module "exa-cluster" {
  source = "git::ssh://devops.scmservice.us-ashburn-1.oci.oraclecloud.com/namespaces/id9de6bj2yv6/projects/claro-devops/repositories/terraform-oci-exa-cluster?ref=v0.2.1"

  for_each = var.exa_cluster

  # network
  network_compartment_id = data.oci_identity_compartments.network_cmp[each.key].compartments[0].id
  subnet_name            = each.value["sn_name"]
  backup_subnet_name     = each.value["bk_sn_name"]

  # exa
  exa_compartment_id          = data.oci_identity_compartments.exa_cmp_lvl3[each.key].compartments[0].id
  infrastructure_display_name = each.value["exa"]

  # secret
  security_compartment_id = data.oci_identity_compartments.security_cmp[each.key].compartments[0].id
  secret_name             = each.value["secret"]

  # vm cluster required
  compartment_id       = data.oci_identity_compartments.cluster_cmp_lvl3[each.key].compartments[0].id
  cpu_core_count       = each.value["cpu_core_count"]
  cluster_display_name = each.key
  gi_version           = each.value["gi_version"]
  hostname             = each.value["hostname"]

  # vm cluster optional
  cluster_name                = each.value["cluster_name"]
  memory_size_in_gbs          = each.value["memory_size_in_gbs"]
  data_storage_size_in_tbs    = each.value["data_storage_size_in_tbs"]
  db_node_storage_size_in_gbs = each.value["db_node_storage_size_in_gbs"]
  time_zone                   = lookup(each.value, "time_zone", "America/Bogota")
  scan_listener_port_tcp      = lookup(each.value, "scan_listener_port", "1521")
  listener_port               = lookup(each.value, "listener_port", "1521")

  # tags
  defined_tags  = lookup(each.value, "defined_tags", {})
  freeform_tags = lookup(each.value, "freeform_tags", {})
}
