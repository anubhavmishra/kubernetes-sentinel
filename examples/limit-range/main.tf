provider "kubernetes" {}

resource "kubernetes_limit_range" "example" {
    metadata {
        name = "sentinel-example"
    }
    spec {
        limit {
            type = "Pod"
            max {
                cpu = "2500m"
                memory = "1024M"
            }
        }
        limit {
            type = "PersistentVolumeClaim"
            min {
                storage = "24M"
            }
        }
        limit {
            type = "Container"
            default {
                cpu = "50m"
                memory = "24M"
            }
       }
   }
 }
