#!/bin/bash

minikube delete

minikube start --driver=docker --cpus=4 --memory='4g'

eval $(minikube docker-env)

docker build -t ft_nginx srcs/nginx
docker build -t ft_wordpress srcs/wordpress
docker build -t ft_mysql srcs/mysql

minikube addons enable metallb

kubectl apply -f srcs/metallb.yml

kubectl apply -f srcs/nginx
kubectl apply -f srcs/mysql
kubectl apply -f srcs/wordpress