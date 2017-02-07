


```
set -k

# Create the namespace
kubectl apply -f ingress/000-namespace.yaml

# Set up the default HTTP backend
kubectl apply -f ingress/010-default-deployment.yaml
kubectl apply -f ingress/020-default-service.yaml

# Set up the nginx ingress controller
kubectl apply -f ingress/030-configmap.yaml
kubectl apply -f ingress/040-deployment.yaml
kubectl apply -f ingress/050-service.yaml

# Create the namespace
kubectl apply -f kube-lego/000-namespace.yaml

# Set up kube-lego
kubectl apply -f kube-lego/010-configmap.yaml
kubectl apply -f kube-lego/020-deployment.yaml

```

```
# Update node firewall settings to allow 80/442

```



The nginx service uses a LoadBalancer to publish the service. A few minutes after you have added the nginx service, you will get it's public IP address or domain via kubectl:

```
kubectl describe svc nginx --namespace nginx-ingress
[...]
LoadBalancer Ingress:   1.2.3.4
[...]
```

This is the IP address where you have to point your domains to. IN AWS you will get a domain, use a CNAME record in this case.

# Create an example app (echoserver)

```
kubectl apply -f echoserver/service.yaml
kubectl apply -f echoserver/deployment.yaml
kubectl apply -f echoserver/ingress-notls.yaml
```

- Make sure the echo service is reachable through http://echo.example.com

# Enable kube-lego

```
```
- Change the email address in `kube-lego-configmap.yaml` before creating the
  kubernetes resource
- Please be aware that kube-lego creates it's related service on its own


# Enable tls for echoserver ingress

```
kubectl apply -f echoserver/ingress-tls.yaml
```

# Get debug information

- Look at the log output of the nginx pod
- Look at the log output of the ingress pods
- Sometimes after acquiring a new certificate nginx needs to be restarted (as
  it's not watching change events for secrets)
