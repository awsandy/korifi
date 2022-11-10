
https://move2kube.konveyor.io/tutorials/cloud-foundry/


https://medium.com/searce/generate-kubernetes-manifest-files-using-move2kube-f0101e59fa8c
Related git repo:
github.com/ganeshkaila/sample-3tier-app.git




Youtube examples:

https://www.youtube.com/watch?v=yLS6f9iseOU&t=620s

https://www.youtube.com/watch?v=Ev2XjWQgJDg


--------------------------------------------


3 tier CF demo: 
https://github.com/komushi/gnavi-mongo


https://github.com/ciberkleid/greeting-ui (hmm)


Needs Cloud9:
Installing - has GO dependancies  (V0.3.4 latest)


Run GUI:

docker run --rm -it -p 8080:8080 \
   -v "${PWD}/move2kube-api-data:/move2kube-api/data" \
   -v //var/run/docker.sock:/var/run/docker.sock \
   quay.io/konveyor/move2kube-ui:v0.3.0

