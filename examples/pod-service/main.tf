provider "kubernetes" {}

resource "kubernetes_pod" "nginx" {
  metadata {
    name = "nginx-pod"

    labels {
      app = "nginx"
    }
  }

  spec {
    container {
      image = "nginx:1.7.8"
      name  = "nginx"

      port {
        container_port = 80
      }
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx"
  }

  spec {
    selector {
      # NGINX pod labels are being referenced
      app = "${kubernetes_pod.nginx.metadata.0.labels.app}"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "${var.service_type}"
  }
}

variable "service_type" {
  default = "LoadBalancer"
}
