const fileListEks = [
  "auto-destroy.sh",
  "auto-deploy.sh",
  "install.sh",
  "destroy.sh",
  "terraform-install.sh",
  "README.md",
  "eks/00-variables.tf",
  "eks/01-provider.tf",
  "eks/02-vpc.tf",
  "eks/03-iam-role-eks.tf",
  "eks/04-cluster.tf",
  "eks/05-iam-role-worker.tf",
  "eks/06-node-group.tf",
  "eks/07-data-source.tf",
  "eks/08-kubeconfig.tf",
  "eks/09-identity-provider.tf",
  "eks/10-check-infra.tf"
];

const fileListEksDrivers = [
  "eks-drivers/main.tf",
  "eks-drivers/provider.tf",
  "eks-drivers/variables.tf"
];

const fileListEck = [
  "eck/resources/crds.yaml",
  "eck/resources/operator.yaml",
  "eck/00-variables.tf",
  "eck/01-provider.tf",
  "eck/02-operator.tf",
  "eck/03-elasticsearch.tf",
  "eck/04-kibana.tf",
  "eck/README.md"
];

const fileListECR = ["ecr/variables.tf", "ecr/provider.tf", "ecr/main.tf"];

const fileListEcrBuildAndPush = [
  "ecr-build&publish/00-variables.tf",
  "ecr-build&publish/01-provider.tf",
  "ecr-build&publish/02-build-image.tf",
  "ecr-build&publish/03-publish-image.tf",
  "ecr-build&publish/README.md"
];

const fileListHelmIstio = [
  "helm/istio.tf",
  "helm/provider.tf",
  "helm/variables.tf"
];

const fileListNamespace = ["namespace/namespace.tf", "namespace/provider.tf"];

const fileListIstioMonitoring = [
  "istio-monitoring/variables.tf",
  "istio-monitoring/provider.tf",
  "istio-monitoring/main.tf",
  "istio-monitoring/README.md"
];

const fileListEksWebUI = [
  "eks-web-ui/provider.tf",
  "eks-web-ui/main.tf",
  "eks-web-ui/README.md"
];

// Below files are not required for M1

// ? Need to add

const fileListAks = [
  "aks/00-variable.tf",
  "aks/01-provider.tf",
  "aks/02-main.tf",
  "aks/03-outputs.tf"
];

const fileListAcr = [
  "acr/00-variable.tf",
  "acr/01-provider.tf",
  "acr/02-main.tf",
  "acr/03-push_image.ps1"
];

const fileListAzure = [
  "azure/auto-destroy.sh",
  "azure/auto-deploy.sh",
  "azure/install.sh",
  "azure/destroy.sh",
  "azure/terraform-install.sh",
  "azure/README.md"
];

const fileListGcp = [
  "gke/gke-cluster",
  "gke/kubernetes-config",
  "gke/outputs.tf",
  "gke/variables.tf",
  "gke/main.tf"
];

module.exports = {
  fileListEks,
  fileListEksDrivers,
  fileListEck,
  fileListGcp,
  fileListAks,
  fileListAcr,
  fileListAzure,
  fileListHelmIstio,
  fileListNamespace,
  fileListECR,
  fileListEcrBuildAndPush,
  fileListIstioMonitoring,
  fileListEksWebUI
};
