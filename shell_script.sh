#!/bin/bash
sed -i "s#image: 192.168.8.135:80/library/harbor_cicd:v.*#image: 192.168.8.168:80/library/harbor_cicd:v${Build_Number_Image}#" Deployment/deployment.yaml
cat Deployment/deployment.yaml
git config --global user.email "josemyr.sebastiao@hotmail.com"
git config --global user.name "Josemyr1993"
git add .
git commit -m "Deployment file modified by Jenkins job with the image Harbor image 192.168.8.135:80/library/harbor_cicd:v${Build_Number_Image}"
