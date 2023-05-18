# Install Venice Router tls certificate with cert-manager

```
kubectl create namespace venice
kubectl create namespace pulsar
# wget pulsar-stack tarball
helm install pulsar -n pulsar ~/dev/pulsar-operator/helm/pulsar-stack -f examples/pulsar/router-tls/pulsar-stack-values.yaml 
kubectl apply -f examples/pulsar/router-tls/certificate.yaml -n venice
helm install venice -n venice ./venice -f examples/pulsar/router-tls/values-router-tls.yaml 
```


