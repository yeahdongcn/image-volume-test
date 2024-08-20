# Kubernetes v1.31 Image Volume Test on Minikube

The Kubernetes documentation provides a simple example of how to use an image volume with a Pod but lacks details on setting up the container runtime. This repository adds the missing details to the Kubernetes documentation.

The following steps are tested on Minikube v1.33.1:

```bash
➜ minikube version
minikube version: v1.33.1
commit: 5883c09216182566a63dff4c326a6fc9ed2982ff
# Using buildx
➜ docker build -t kicbase:crio-v1.31 -o type=docker .
➜ ./start.sh
```

Deploy a pod with image volume:

```bash
➜ kubectl apply -f oci.yaml
➜ kubectl get pod pod
NAME   READY   STATUS    RESTARTS   AGE
pod    1/1     Running   0          10m
➜ kubectl exec -it pod -- bash
root@pod:/# ls /
bin  boot  dev  etc  home  lib  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var  volume
root@pod:/# ls /volume/
bin  boot  dev  etc  home  lib  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```
