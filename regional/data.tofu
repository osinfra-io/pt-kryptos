# Google Client Config Data Source
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/data-sources/client_config

data "google_client_config" "this" {}

# Google Container Cluster Data Source
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/data-sources/container_cluster

data "google_container_cluster" "this" {
  location = module.core_helpers.region
  name     = "${var.kubernetes_cluster_prefix}-${module.core_helpers.region}-${module.core_helpers.zone}"
  project  = var.kubernetes_cluster_project
}
