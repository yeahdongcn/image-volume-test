#!/bin/bash

minikube stop
minikube delete
minikube image load kicbase:crio-v1.31
minikube start --container-runtime=cri-o --kubernetes-version=v1.31.0 --feature-gates=ImageVolume=true --base-image="kicbase:crio-v1.31"