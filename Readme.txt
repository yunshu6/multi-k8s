# For running and testing locally
```
minikube start 
minikube addons enable ingress ## which is stated in [Ingress-nginx doc](https://kubernetes.github.io/ingress-nginx/deploy/)
kubectl create secret generic pgpassword --from-literal PGPASSWORD=123456 ## create a secret for postgres password
kubectl apply -f k8s_config
```

Then type `minikube ip` to get the ip address to access the website in your browser.

# For running on GCP, push code to github

