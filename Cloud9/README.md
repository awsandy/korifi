

* create Kind cluster

--image kindest/node:v1.23.12
#deploy_korifi





* set env vars

export ROOT_NAMESPACE="cf"
export KORIFI_NAMESPACE="korifi-system"
export ADMIN_USERNAME="cf-admin"
export BASE_DOMAIN="vcap.me"

------

* install helm chart
helm install korifi https://github.com/cloudfoundry/korifi/releases/download/v0.4.0/korifi-0.4.0.tgz --create-namespace --namespace="$KORIFI_NAMESPACE"     --set=global.generateIngressCertificates=true     --set=global.rootNamespace="$ROOT_NAMESPACE"     --set=adminUserName="$ADMIN_USERNAME"     --set=api.apiServer.url="api.$BASE_DOMAIN"     --set=global.defaultAppDomainName="apps.$BASE_DOMAIN"     --set=api.packageRepositoryPrefix=europe-west1-docker.pkg.dev/my-project/korifi/packages     --set=kpack-image-builder.builderRepository=europe-west1-docker.pkg.dev/my-project/korifi/kpack-builder     --set=kpack-image-builder.dropletRepositoryPrefix=europe-west1-docker.pkg.dev/my-project/korifi/droplets


-----






cf api --skip-ssl-validation https://api.vcap.me

cf login
cf-admin

cf create-org test
cf t -o test



