
https://gist.github.com/pauldougan/81df7551d358fda9e7ead2f27a98081b

https://github.com/cloudfoundry/korifi/blob/main/INSTALL.md#post-install-configuration

Install

eksctl

sudo wget -O /etc/yum.repos.d/cloudfoundry-cli.repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo
# ...then, install the cf CLI (which will also download and add the public key to your system)
sudo yum -y install cf8-cli

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp   > /dev/null
sudo mv -v /tmp/eksctl /usr/local/bin > /dev/null
 echo "eksctl completion"
 eksctl completion bash >> ~/.bash_completion
 
 sudo ln -s /usr/bin/sha1sum /usr/bin/shasum 
# standard matrics server install
kubectl apply -f tests/vendor/metrics-server-local
kubectl get apiservice v1beta1.metrics.k8s.io

 kubectl apply -f "$VENDOR_DIR/cert-manager"
 kubectl -n cert-manager rollout status deployment/cert-manager --watch=true
 kubectl -n cert-manager rollout status deployment/cert-manager-webhook --watch=true
 kubectl -n cert-manager rollout status deployment/cert-manager-cainjector --watch=true

kubectl apply -f "$VENDOR_DIR/kpack"
kubectl patch -n kpack deployment kpack-controller -p   '{"spec": {"template": {"spec": {"containers": [{"name": "controller", "resources": {"limits": {"cpu": "500m"}}}]}}}}'
kubectl apply -f "$VENDOR_DIR/contour"

kubectl apply -f /home/ec2-user/environment/korifi/eks/tests/vendor/service-binding/servicebinding-runtime-v0.2.0.yaml
kubectl -n servicebinding-system rollout status deployment/servicebinding-controller-manager --watch=true
kubectl apply -f /home/ec2-user/environment/korifi/eks/tests/vendor/service-binding/servicebinding-workloadresourcemappings-v0.2.0.yaml

# run addme.sh for andyt530

export ROOT_NAMESPACE="cf"
export KORIFI_NAMESPACE="korifi-system"
#export ADMIN_USERNAME="andyt530"
export ADMIN_USERNAME="kubernetes-admin"
export BASE_DOMAIN="example.com"
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: $ROOT_NAMESPACE
  labels:
    pod-security.kubernetes.io/audit: restricted
    pod-security.kubernetes.io/enforce: restricted
EOF
helm upgrade --install korifi https://github.com/cloudfoundry/korifi/releases/download/v0.4.0/korifi-0.4.0.tgz --namespace="$KORIFI_NAMESPACE"     --set=global.generateIngressCertificates=true     --set=global.rootNamespace="$ROOT_NAMESPACE"     --set=adminUserName="$ADMIN_USERNAME"     --set=api.apiServer.url="api.$BASE_DOMAIN"     --set=global.defaultAppDomainName="apps.$BASE_DOMAIN"     --set=api.packageRepositoryPrefix=europe-west1-docker.pkg.dev/my-project/korifi/packages     --set=kpack-image-builder.builderRepository=europe-west1-docker.pkg.dev/my-project/korifi/kpack-builder --set=kpack-image-builder.dropletRepositoryPrefix=europe-west1-docker.pkg.dev/my-project/korifi/droplets



kubectl get services -ALL
nslookup a0a9f706a1bf047238222a2a3f8d14dd-693427061.eu-west-2.elb.amazonaws.com
kubectl get HTTPProxy -A
nslookup api.example.com

# add  api.example.com x.x.x.x  >> etc/hosts

cf api --skip-ssl-validation https://api.example.com

cf login

cf curl /whoami
{"name":"kubernetes-admin","kind":"User"}


cf create-org demo-org
cf t -o demo-org
cf create-space sandbox
cf t -s sandbox
cf t



git clone https://github.com/paketo-buildpacks/samples paketo-buildpacks && cd paketo-buildpacks

cd procfile/procfile-sample
cf push procfile -m 128M
cf apps
cf app procfile
cf logs static --recent



helm uninstall korifi -n korifi-system 






