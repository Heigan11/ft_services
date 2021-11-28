#!/bin/bash
minikube stop
minikube delete
minikube start --vm-driver=virtualbox --cpus=2 --disk-size="14000mb" --memory="4000mb"
eval $(minikube docker-env)
minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server
kubectl apply -f ./srcs/configmap.yaml
docker build -t nginx_img ./srcs/nginx/
kubectl apply -f ./srcs/nginx/nginx.yaml
docker build -t mysql_img ./srcs/mysql/
kubectl apply -f ./srcs/mysql/mysql.yaml
docker build -t wp_img ./srcs/wordpress/
kubectl apply -f ./srcs/wordpress/wordpress.yaml
docker build -t phpmyadmin_img ./srcs/phpmyadmin/
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
docker build -t ftps_img ./srcs/ftps/
kubectl apply -f ./srcs/ftps/ftps.yaml
docker build -t img_influxdb ./srcs/influx/
kubectl apply -f ./srcs/influx/influx.yaml
docker build -t telegraf_img ./srcs/telegraf/
kubectl apply -f ./srcs/telegraf/telegraf.yaml
docker build -t grafana_img ./srcs/grafana/
kubectl apply -f ./srcs/grafana/grafana.yaml
minikube dashboard
