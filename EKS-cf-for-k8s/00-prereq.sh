# 
#wget https://github.com/cloudfoundry/bosh-cli/releases/download/v7.0.1/bosh-cli-7.0.1-linux-amd64
wget https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.17/bosh-cli-6.4.17-linux-amd64
mv bosh-cli-6.4.17-linux-amd64 bosh
chmod +x ./bosh
sudo mv ./bosh /usr/local/bin/bosh
wget -O- https://carvel.dev/install.sh | bash
./install.sh
# or with curl...
#curl -L https://carvel.dev/install.sh | bash
kapp --version
ytt version
#
# docker hub username and token
# docker assumed




#fix for newer kubectl (aws version must be 2.7.5 +)
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update


#sed -i -e "s,client.authentication.k8s.io/v1alpha1,client.authentication.k8s.io/v1beta1,g" ~/.kube/config

