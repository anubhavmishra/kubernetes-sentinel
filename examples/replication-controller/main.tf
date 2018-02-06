provider "kubernetes" {}

resource "kubernetes_replication_controller" "nginx" {
  metadata {
    name = "nginx-example"

    labels {
      app = "nginx-example"
    }
  }

  spec {
    replicas = "${var.replicas}"

    selector {
      app = "nginx-example"
    }

    template {
      container {
        image = "nginx:1.7.8"
        name  = "nginx"

        port {
          container_port = 80
        }

        resources {
          limits {
            cpu    = "0.5"
            memory = "512Mi"
          }

          requests {
            cpu    = "250m"
            memory = "50Mi"
          }
        }
      }
    }
  }
}

# NGINX kubernetes service specification
resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx-example"
  }

  spec {
    selector {
      # NGINX pod labels are being referenced
      app = "${kubernetes_replication_controller.nginx.metadata.0.labels.app}"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}

variable "replicas" {
  default = 15
}
