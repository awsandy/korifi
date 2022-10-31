git clone https://github.com/cloudfoundry/cf-for-k8s.git && cd cf-for-k8s

##  ?? vcp.me ? nope for EKS
./hack/generate-values.sh -d vcap.me > ./cf-install-values.yml
cat >> cf-install-values.yml << EOL
app_registry:
  hostname: https://index.docker.io/v1/
  repository_prefix: "devopsschools"
  username: "andyt530"
  password: "$DKT"
EOL
cat >> cf-install-values.yml << EOL
add_metrics_server_components: true
enable_automount_service_account_token: true
metrics_server_prefer_internal_kubelet_address: true
remove_resource_requirements: true
use_first_party_jwt_tokens: true

load_balancer:
  enable: false
EOL

ytt -f config -f ./cf-install-values.yml > ./cf-for-k8s-rendered.yml
# deploy cf-for-k8s for 
kapp deploy -a cf -f ./cf-for-k8s-rendered.yml -y
kapp list