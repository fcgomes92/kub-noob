# kub-noob

### Steps

Start the kub local service

```bash
minikube start
```

Start the dashboard to make it easier to check some stuff

```bash
minikube dashboard
```

If you want to use local images on minikube, check the [Docker Images Section](#Docker)

### Create deployment

Create a deployment using the [Deploy file](./deploy.yml)

```bash
kubectl apply -f ./deploy.yml
```

### Accessing the exposed service

Start the service on minikube. This will expose the nodePort to be accessed on your minikube id.

```bash
minikube service [<Your deployment name defined under: metadata.name>](./deploy.yml)
```

The command above will open the URL in your default browser, but you can also get the URL using the following command:

```bash
minikube ip # get your minikube's ip
```

Now get the port defined on the service ([nodePort](./deploy.yml)) and access: `<minikube ip>:<nodePort>`

This step is important locally because, as the [kubernetes wiki](https://kubernetes.io/docs/tutorials/hello-minikube/#create-a-service) says:

`On cloud providers that support load balancers, an external IP address would be provisioned to access the Service. On Minikube, the LoadBalancer type makes the Service accessible through the minikube service command.`

--- 

You can also tunnel your connection

```bash
minikube tunnel
```

Then you can get your external ip and access directly the target port defined in the [deplyment file](./deploy.yml): ```<external_ip>:<targetPort>```

#### Docker

To use local images in minikube use:

```bash
$(minikube docker-env)
```

Maybe you will have to point the DOCKER_CERT_PATH to the right location

```bash
export DOCKER_CERT_PATH=~/.minikube/certs
```

Now you can build your local images

```bash
docker-compose build

# or

docker build -t kub-noob .
```

Now your image is built inside minikube

To revert to your local docker use:

```bash
$(minikube docker-env -u)
```
