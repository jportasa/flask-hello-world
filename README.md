# Build the image
```
docker build . -t doodle:0.1.0
```
# Create kind k8s cluster
## Create the cluster
```
kind create cluster --name doodle --config kind-cluster/config.yaml
```
# Install the webserver in k8s
## Create namespace for the webserver
```
kubectl create namespace doodle
```
## Copy local image to kind cluster
```
kind load docker-image doodle:0.1.0 --name doodle
```
## Install Chart
```
helm install doodle ./chart -n doodle
```
# Test webserver app
```
 kubectl port-forward service/doodle 8080:80 -n doodle
```
Access with your browser to http://localhost:8080