const fileListAws = [
  "auto-destroy.sh",
  "auto-deploy.sh",
  "install.sh",
  "destroy.sh",
  "terraform-install.sh",
  "README.md",
  "eks/cluster.tf",
  "eks/IAMrole-eks.tf",
  "eks/IAMrole-worker.tf",
  "eks/kubeconfig.tf",
  "eks/identity-provider.tf",
  "eks/node-group.tf",
  "eks/provider.tf",
  "eks/variables.tf",
  "eks/vpc.tf",
  "eks/autoscaling-group.tf",
  "eks/check-infra.tf",
  "eks/data-source.tf"
];

const fileListECR = [
  "ecr/variables.tf",
  "ecr/provider.tf",
  "ecr/main.tf"
];

const fileListEcrBuildAndPush = [
  "ecr-build&publish/00-variables.tf",
  "ecr-build&publish/01-provider.tf",
  "ecr-build&publish/02-build-image.tf",
  "ecr-build&publish/03-publish-image.tf",
  "ecr-build&publish/README.md",
];

const fileListEBS = [
  "ebs/variables.tf",
  "ebs/provider.tf",
  "ebs/main.tf"
];

const fileListHelmIstio = [
  "helm/istio.tf", 
  "helm/provider.tf"
];

const fileListNamespace = [
  "namespace/namespace.tf", 
  "namespace/provider.tf"
];

const fileListIstioMonitoring = [
  "istio-monitoring/variables.tf",
  "istio-monitoring/provider.tf",
  "istio-monitoring/main.tf",
  "istio-monitoring/README.md"
];

const fileListEksWebUI = [
  "eks-web-ui/provider.tf",
  "eks-web-ui/main.tf"
];

// Below files are not required for M1

// ? Need to add

const fileListAzure = [
  "aks/aks-cluster",
  "aks/kubernetes-config",
  "aks/outputs.tf",
  "aks/variables.tf",
  "aks/main.tf"
];

const fileListGcp = [
  "gke/gke-cluster",
  "gke/kubernetes-config",
  "gke/outputs.tf",
  "gke/variables.tf",
  "gke/main.tf"
];

module.exports = {
  fileListAws,
  fileListGcp,
  fileListAzure,
  fileListHelmIstio,
  fileListNamespace,
  fileListEBS,
  fileListECR,
  fileListEcrBuildAndPush,
  fileListIstioMonitoring,
  fileListEksWebUI
};
