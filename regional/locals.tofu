# Local Values
# https://opentofu.org/docs/language/values/locals
#
# Helm set values derived from OpenTofu context (labels, environment-specific overrides).

locals {
  helm_set_values = concat(
    [
      {
        name  = "server.extraLabels.env"
        value = module.core_helpers.environment
      },
      {
        name  = "server.extraLabels.team"
        value = "pt-kryptos"
      },
    ],
    module.core_helpers.env == "sb" ? [
      {
        name  = "server.affinity"
        value = ""
      },
      {
        name  = "server.ha.enabled"
        value = "false"
      },
    ] : []
  )
}
