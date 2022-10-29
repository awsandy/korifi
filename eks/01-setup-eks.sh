cat << EOF | eksctl create cluster -f -
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig
metadata:
  name: my-cluster
  region: eu-west-2
  version: '1.23'
  tags:
    karpenter.sh/discovery: cluster-with-karpenter
iam:
  withOIDC: true
  serviceAccounts:
  - metadata:
      name: cert-manager
      namespace: cert-manager
    wellKnownPolicies:
      certManager: true
  - metadata:
      name: aws-load-balancer-controller
      namespace: kube-system
    wellKnownPolicies:
      awsLoadBalancerController: true


karpenter:
  version: '0.15.0'
  createServiceAccount: true # default is false

managedNodeGroups:
  - name: managed-ng-1
    minSize: 1
    maxSize: 2
    desiredCapacity: 1
    volumeSize: 120

    
EOF


