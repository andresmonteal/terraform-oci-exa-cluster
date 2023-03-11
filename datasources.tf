data "oci_core_subnets" "subnet" {
  #Required
  compartment_id = var.network_compartment_id

  #Optional
  display_name = var.subnet_name
}

data "oci_core_subnets" "backup_subnet" {
  #Required
  compartment_id = var.network_compartment_id

  #Optional
  display_name = var.backup_subnet_name
}

data "oci_database_cloud_exadata_infrastructures" "exa_inf" {
  #Required
  compartment_id = var.exa_compartment_id

  #Optional
  display_name = var.infrastructure_display_name
  state        = "AVAILABLE"
}

data "oci_database_db_servers" "db_servers" {
  #Required
  compartment_id = var.compartment_id

  exadata_infrastructure_id = local.cloud_exadata_infrastructure_id
}

# This data source provides the list of Secrets in Oracle Cloud Infrastructure Vault service.
data "oci_vault_secrets" "secret" {
  count = var.ssh_public_keys == null ? 1 : 0
  #Required
  compartment_id = var.security_compartment_id

  #Optional
  name = var.secret_name
}

# This data source provides details about a specific Secretbundle resource in Oracle Cloud Infrastructure Secrets service.
data "oci_secrets_secretbundle" "bundle" {
  count     = var.ssh_public_keys == null ? 1 : 0
  secret_id = data.oci_vault_secrets.secret[0].secrets[0].id
}