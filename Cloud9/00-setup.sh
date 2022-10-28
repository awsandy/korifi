# ...first configure the Cloud Foundry Foundation package repository
sudo wget -O /etc/yum.repos.d/cloudfoundry-cli.repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo
# ...then, install the cf CLI (which will also download and add the public key to your system)
sudo yum -y install cf8-cli
#
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

# install helm, kind ,pack 

# install jq, kubectl, pack
kind delete cluster --name cf

chmod a+rx ./scripts/deploy-on-kind.sh
./scripts/deploy-on-kind.sh cf


