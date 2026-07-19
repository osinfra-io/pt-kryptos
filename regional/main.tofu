# Helm Release Resource
# https://search.opentofu.org/provider/hashicorp/helm/latest/docs/resources/release

resource "helm_release" "openbao" {
  chart      = "openbao"
  name       = "openbao"
  namespace  = "pt-kryptos-openbao"
  repository = "https://openbao.github.io/openbao-helm"

  set = local.helm_set_values

  values = [
    file("${path.module}/helm/openbao.yml")
  ]

  version = var.openbao_version
}
