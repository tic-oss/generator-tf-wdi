resource "kubectl_manifest" "kibana" {
  yaml_body = <<YAML
      apiVersion: kibana.k8s.elastic.co/v1
      kind: Kibana
      metadata:
        name: quickstart
      spec:
        version: 8.7.0
        count: 1
        elasticsearchRef:
          name: quickstart
<%_ if (minikube == "false") { _%>          
        podTemplate:
            spec:
              affinity:
                nodeAffinity:
                  requiredDuringSchedulingIgnoredDuringExecution:
                    nodeSelectorTerms:
                    - matchExpressions:
                      - key: eks.amazonaws.com/nodegroup
                        operator: In
                        values:
                        - ${var.cluster_name}-eck-node-group
<%_ } _%>
  YAML

  depends_on = [
    kubectl_manifest.elasticsearch
  ]
}

resource "kubectl_manifest" "kibana_lb" {
  yaml_body = <<YAML
      apiVersion: v1
      kind: Service
      metadata:
        name: kibana-nlb
<%_ if (minikube == "false") { _%>          
        annotations:
          service.beta.kubernetes.io/aws-load-balancer-type: external 
          service.beta.kubernetes.io/aws-load-balancer-scheme: internet-facing
          service.beta.kubernetes.io/aws-load-balancer-nlb-target-type: instance
<%_ } _%>
        namespace: default
      spec:
        type: LoadBalancer
        ports:
          - port: 5601
            targetPort: 5601
            name: http
        selector:
          common.k8s.elastic.co/type: kibana
          kibana.k8s.elastic.co/name: quickstart
  YAML

  depends_on = [
    kubectl_manifest.kibana
  ]
}
