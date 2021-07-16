resource "helm_release" "vault" {
  count     = data.terraform_remote_state.cluster.outputs.enable_consul_and_vault ? 1 : 0
  name      = "${data.terraform_remote_state.consul.outputs.release_name}-vault"
  namespace = data.terraform_remote_state.consul.outputs.namespace

  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = "0.13.0"


  set {
    name  = "server.ha.enabled"
    value = "true"
  }
}