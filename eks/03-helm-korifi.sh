export ROOT_NAMESPACE="cf"
export KORIFI_NAMESPACE="korifi-system"
export ADMIN_USERNAME="andyt530"
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
helm install korifi https://github.com/cloudfoundry/korifi/releases/download/v0.4.0/korifi-0.4.0.tgz --create-namespace --namespace="$KORIFI_NAMESPACE"     --set=global.generateIngressCertificates=true     --set=global.rootNamespace="$ROOT_NAMESPACE"     --set=adminUserName="$ADMIN_USERNAME"     --set=api.apiServer.url="api.$BASE_DOMAIN"     --set=global.defaultAppDomainName="apps.$BASE_DOMAIN"     --set=api.packageRepositoryPrefix=europe-west1-docker.pkg.dev/my-project/korifi/packages     --set=kpack-image-builder.builderRepository=europe-west1-docker.pkg.dev/my-project/korifi/kpack-builder     --set=kpack-image-builder.dropletRepositoryPrefix=europe-west1-docker.pkg.dev/my-project/korifi/droplets