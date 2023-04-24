exa_cluster = {
  "EXA-CLUSTER-NAME" = {
    cluster_cmp                 = ["LVL1", "LVL2", "LVL3"]
    security_cmp                = "security-cmp"
    network_cmp                 = "network-cmp"
    sn_name                     = "subnet-name"
    bk_sn_name                  = "backup-subnet-name"
    exa                         = "exa-infra-name"
    secret                      = "exa-ssh-key-pub"
    cpu_core_count              = 192
    gi_version                  = "19.18.0.0"
    hostname                    = "srvexa01-test"
    cluster_name                = "TESTEXA01"
    memory_size_in_gbs          = null
    data_storage_size_in_tbs    = null
    db_node_storage_size_in_gbs = null
    defined_tags                = { "NAMESPACE.TAG" = "VALUE", "NAMESPACE.TAG" = "VALUE-2" }
  }
}