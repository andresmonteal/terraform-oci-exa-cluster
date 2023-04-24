
# Copyright (c) 2019, 2021, Oracle Corporation and/or affiliates.

variable "tenancy_ocid" {
  description = "root compartment"
  default     = "tenancy-id"
}

# general oci parameters

# variable
variable "exa_cluster" {
  type = map(any)
}