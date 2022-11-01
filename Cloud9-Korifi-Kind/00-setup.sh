# ...first configure the Cloud Foundry Foundation package repository
sudo wget -O /etc/yum.repos.d/cloudfoundry-cli.repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo
# ...then, install the cf CLI (which will also download and add the public key to your system)
sudo yum -y install cf8-cli
#
#git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
#mkdir ~/.linuxbrew/bin
#ln -s ../Homebrew/bin/brew ~/.linuxbrew/bin
#eval $(~/.linuxbrew/bin/brew shellenv)

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/ec2-user/.bash_profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#
curl -sfL https://direnv.net/install.sh | bash
echo "eval '$(direnv hook bash)'" >> ~/.bashrc
source ~/.bashrc

brew install kind
brew install buildpacks/tap/pack
brew install derailed/k9s/k9s
sudo ln -s /usr/bin/sha1sum /usr/bin/shasum 
brew install kustomize
brew install kubebuilder
#curl -sL https://fluxcd.io/install | sh

# MAC only
#brew install gsed
#sudo ln -s /home/linuxbrew/.linuxbrew/Cellar/gnu-sed/4.8/bin/sed /usr/bin/gsed

#brew tap vmware-tanzu/carvel
#brew install kbld

# install helm, kind ,pack 
go install sigs.k8s.io/controller-runtime/tools/setup-envtest@latest


git clone https://github.com/cloudfoundry/korifi 
cd korifi
direnv allow



# install jq, kubectl, pack
kind delete cluster --name cf

chmod a+rx ./scripts/deploy-on-kind.sh
./scripts/deploy-on-kind.sh cf

export ROOT_NAMESPACE="cf"
export KORIFI_NAMESPACE="korifi-system"
export ADMIN_USERNAME="cf-admin"
export BASE_DOMAIN="vcap.me"

helm install korifi https://github.com/cloudfoundry/korifi/releases/download/v0.4.0/korifi-0.4.0.tgz \   
    --create-namespace \
    --namespace="$KORIFI_NAMESPACE" \
    --set=global.generateIngressCertificates=true \
    --set=global.rootNamespace="$ROOT_NAMESPACE" \
    --set=adminUserName="$ADMIN_USERNAME" \
    --set=api.apiServer.url="api.$BASE_DOMAIN" \
    --set=global.defaultAppDomainName="apps.$BASE_DOMAIN" \
    --set=api.packageRepositoryPrefix=europe-west1-docker.pkg.dev/my-project/korifi/packages \
    --set=kpack-image-builder.builderRepository=europe-west1-docker.pkg.dev/my-project/korifi/kpack-builder \
    --set=kpack-image-builder.dropletRepositoryPrefix=europe-west1-docker.pkg.dev/my-project/korifi/droplets



kubectl get HTTPProxy/korifi-api-proxy -n korifi-system -o yaml
kubectl get HTTPProxy -A


cf api --skip-ssl-validation https://api.vcap.me

cf login
> cf-admin

------

https://hub.docker.com/r/kindest/node/tags

kind create cluster --image kindest/node:v1.23.12 --name "${cluster}" --wait 5m --config="$SCRIPT_DIR/assets/kind-config.yaml"

