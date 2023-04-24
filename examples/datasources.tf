# compartments resolution
data "oci_identity_compartments" "cluster_cmp_lvl1" {
  for_each = var.exa_cluster
  #Required
  compartment_id = var.tenancy_ocid

  #Optional
  name = each.value["cluster_cmp"][0]
}

data "oci_identity_compartments" "cluster_cmp_lvl2" {
  for_each = var.exa_cluster
  #Required
  compartment_id = data.oci_identity_compartments.cluster_cmp_lvl1[each.key].compartments[0].id

  #Optional
  name = each.value["cluster_cmp"][1]
}

data "oci_identity_compartments" "cluster_cmp_lvl3" {
  for_each = var.exa_cluster
  #Required
  compartment_id = data.oci_identity_compartments.cluster_cmp_lvl2[each.key].compartments[0].id

  #Optional
  name = each.value["cluster_cmp"][2]
}

data "oci_identity_compartments" "network_cmp" {
  for_each = var.exa_cluster
  #Required
  compartment_id = var.tenancy_ocid

  #Optional
  name = each.value["network_cmp"]
}

data "oci_identity_compartments" "security_cmp" {
  for_each = var.exa_cluster
  #Required
  compartment_id = var.tenancy_ocid

  #Optional
  name = each.value["security_cmp"]
}

data "oci_identity_compartments" "exa_cmp_lvl1" {
  for_each = var.exa_cluster
  #Required
  compartment_id = var.tenancy_ocid

  #Optional
  name = can(each.value["exa_cmp"][0]) ? each.value["exa_cmp"][0] : each.value["cluster_cmp"][0]
}

data "oci_identity_compartments" "exa_cmp_lvl2" {
  for_each = var.exa_cluster
  #Required
  compartment_id = data.oci_identity_compartments.exa_cmp_lvl1[each.key].compartments[0].id

  #Optional
  name = can(each.value["exa_cmp"][1]) ? each.value["exa_cmp"][1] : each.value["cluster_cmp"][1]
}

data "oci_identity_compartments" "exa_cmp_lvl3" {
  for_each = var.exa_cluster
  #Required
  compartment_id = data.oci_identity_compartments.exa_cmp_lvl2[each.key].compartments[0].id

  #Optional
  name = can(each.value["exa_cmp"][2]) ? each.value["exa_cmp"][2] : each.value["cluster_cmp"][2]
}