# metrics server
# same as 
#kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.5.0/components.yaml
#
#kubectl apply -f kpack
#kubectl apply -f contour
#kubectl apply -f service-binding/servicebinding-runtime-v*.yaml
#kubectl -n servicebinding-system rollout status deployment/servicebinding-controller-manager --watch=true
#kubectl apply -f service-binding/servicebinding-workloadresourcemappings-v*.yaml"
cd scripts
./install-dependacies.sh

