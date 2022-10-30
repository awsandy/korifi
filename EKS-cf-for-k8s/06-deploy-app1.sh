cf push test-node-app -p ./tests/smoke/assets/test-node-app
#Or you can push any app you wish just cd into the directory and push the app with the following command.
#$ cf push APP-NAME
#Once your app stages you can find it in Cloud Foundry with this command.
cf apps
#The output in the terminal should look something as follows.
#Getting apps in org test-org / space test-space as admin...
#OK
#name            requested state   instances   memory   disk   urls
#test-node-app   started           1/1         1G       1G     test-node-app.vcap.me
#To see the pods that have applications on your Cloud Foundry instance look in the cf-workloads namespace.
kubectl get pods -n cf-workloads
# Access using https
curl -k https://test-node-app.apps.vcap.me