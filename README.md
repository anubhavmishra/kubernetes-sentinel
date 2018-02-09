# kubernetes-sentinel

Examples to showcase Kubernetes and HashiCorp Sentinel integration. These include:

* [pod-service](./examples/pod-service) - Enforce policies for a service type (eg: `NodePort` or `ClusterIP`) using Sentinel.
* [replication-controller](./examples/replication-controller) - Enforce policies for replica count on a replication controller.
* [limit-ranges](./examples/limit-range) - Enforce policies for a pod's CPU limits.
* [namespace](./examples/namespace) - Enforce policies for the naming convention for a namspace.

Few of these examples are showcased in the blog post [Applying Policy as Code to Kubernetes Resources](https://www.hashicorp.com/blog/applying-policy-as-code-to-kubernetes-resources).
