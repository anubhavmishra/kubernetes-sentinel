provider "kubernetes" {}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "${var.namespace_name}"

    annotations {
      name = "${var.namespace_name}"
    }
  }
}

variable "namespace_name" {
  default = "sentinel-example"
}
