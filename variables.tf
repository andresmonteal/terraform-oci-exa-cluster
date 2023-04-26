variable "compartment_id" {
  description = "(Required) (Updatable) The OCID of the compartment."
}

variable "exa_compartment_id" {
  description = "(Required) (Updatable) The OCID of the compartment."
}

variable "network_compartment_id" {
  description = "(Required) (Updatable) The OCID of the compartment for network resources."
}

variable "subnet_name" {
  description = "Virtual cloud network name"
  type        = string
}

variable "backup_subnet_name" {
  description = "Virtual cloud network name"
  type        = string
}

# ssh keys
variable "security_compartment_id" {
  description = "(Required) (Updatable) The name of the compartment for security resources."
  type        = string
  default     = null
}

variable "secret_name" {
  description = "(Required) (Updatable) The name of the secret where the ssh key is stored."
  type        = string
  default     = null
}

variable "ssh_public_keys" {
  description = "(Required) (Updatable) The public key portion of one or more key pairs used for SSH access to the cloud VM cluster."
  type        = list(string)
  default     = null
}

# exa infra
variable "infrastructure_display_name" {
  description = "(Required) (Updatable) The user-friendly name for the cloud Exadata infrastructure resource. The name does not need to be unique."
  type        = string
}

# vm cluster variables
variable "cpu_core_count" {
  description = "(Required) (Updatable) The number of CPU cores to enable for a cloud VM cluster."
  type        = string
}

variable "cluster_display_name" {
  description = "(Required) (Updatable) The user-friendly name for the cloud VM cluster. The name does not need to be unique."
  type        = string
}

variable "gi_version" {
  description = "(Required) A valid Oracle Grid Infrastructure (GI) software version."
  type        = string
}

variable "hostname" {
  description = "(Required) The hostname for the cloud VM cluster. The hostname must begin with an alphabetic character, and can contain alphanumeric characters and hyphens (-). The maximum length of the hostname is 16 characters for bare metal and virtual machine DB systems, and 12 characters for Exadata systems."
  type        = string
}


# optionals

variable "cluster_name" {
  description = "The cluster name for cloud VM cluster. The cluster name must begin with an alphabetic character, and may contain hyphens (-). Underscores (_) are not permitted. The cluster name can be no longer than 11 characters and is not case sensitive."
  type        = string
  default     = null
}

variable "data_storage_percentage" {
  description = "(Optional) The percentage assigned to DATA storage (user data and database files). The remaining percentage is assigned to RECO storage (database redo logs, archive logs, and recovery manager backups). Accepted values are 35, 40, 60 and 80. "
  type        = string
  default     = 80
}

variable "is_local_backup_enabled" {
  description = "(Optional) If true, database backup on local Exadata storage is configured for the cloud VM cluster. If false, database backup on local Exadata storage is not available in the cloud VM cluster."
  type        = string
  default     = "false"
}

variable "is_sparse_diskgroup_enabled" {
  description = "(Optional) If true, the sparse disk group is configured for the cloud VM cluster. If false, the sparse disk group is not created."
  type        = string
  default     = "false"
}

variable "license_model" {
  description = "(Optional) (Updatable) The Oracle license model that applies to the cloud VM cluster. The default is BRING_YOUR_OWN_LICENSE."
  type        = string
  default     = "BRING_YOUR_OWN_LICENSE"
}

variable "memory_size_in_gbs" {
  description = "(Optional) (Updatable) The memory to be allocated in GBs."
  type        = string
  default     = ""
}

variable "ocpu_count" {
  description = "(Optional) (Updatable) The number of OCPU cores to enable for a cloud VM cluster. Only 1 decimal place is allowed for the fractional part."
  type        = string
  default     = null
}

variable "time_zone" {
  description = "(Optional) The time zone to use for the cloud VM cluster."
  type        = string
  default     = "UTC"
}

variable "data_storage_size_in_tbs" {
  description = "(Optional) The data disk group size to be allocated in TBs."
  type        = string
  default     = ""
}

variable "db_node_storage_size_in_gbs" {
  description = "(Optional) The local node storage to be allocated in GBs."
  type        = string
  default     = ""
}

variable "scan_listener_port_tcp" {
  description = " (Optional) The TCP Single Client Access Name (SCAN) port."
  type        = string
  default     = "1521"
}

# tags

variable "freeform_tags" {
  description = "simple key-value pairs to tag the created resources using freeform OCI Free-form tags."
  type        = map(any)
  default     = {}
}

variable "defined_tags" {
  description = "simple key-value pairs to tag the created resources using freeform OCI Free-form tags."
  type        = map(any)
  default     = {}
}