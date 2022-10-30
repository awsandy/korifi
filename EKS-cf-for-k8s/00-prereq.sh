# 
#wget https://github.com/cloudfoundry/bosh-cli/releases/download/v7.0.1/bosh-cli-7.0.1-linux-amd64
wget https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.17/bosh-cli-6.4.17-linux-amd64
chmod +x ./bosh
mv bosh-cli-6.4.17-linux-amd64 bosh
sudo mv ./bosh /usr/local/bin/bosh
wget -O- https://carvel.dev/install.sh | bash
# or with curl...
#curl -L https://carvel.dev/install.sh | bash
kapp --version
wget https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.35.1/ytt-linux-amd64
mv ytt-linux-amd64 ytt
chmod +x ./ytt
sudo mv ./ytt /usr/local/bin/ytt
ytt version
#
# docker hub username and token
# docker assumed

