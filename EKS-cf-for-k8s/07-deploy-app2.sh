git clone https://github.com/cloudfoundry-samples/test-app.git
cd test-app
cf push test-app
# Access using following urls
curl -k https://test-node-app.apps.vcap.me
curl -k https://test-app-grumpy-wallaby-gi.apps.vcap.me
curl -k https://test-app-grumpy-wallaby-gi.apps.vcap.me/env
curl -k https://test-app-grumpy-wallaby-gi.apps.vcap.me/exit
curl -k https://test-app-grumpy-wallaby-gi.apps.vcap.me/index
curl -k https://test-app-grumpy-wallaby-gi.apps.vcap.me/port