# CI/CD process with Kubernetes, Harbor, Jenkins, ArgoCD, Git and Containerd :rocket:


<img src="https://github.com/Josemyr1993/jenkins_argo_cd_harbor_docker_kubernetes/blob/main/CI_CD_new.gif" heigh="1000" width="1000">


<h2>Tools needed</h2>

- Jenkins.
- ArgoCD.
- GitHub.
- Harbor.
- Containerd.
- K8s Cluster.
- Good mood 😉.

<h3>Explaning the Workflow</h3>

1. DevOps Engineer create a docker file with the specific configurations for the environment and dependencies.
2. DevOps Enginner will commit and push the files created to Git repository.
3. Jenkins jobs pulls the code from source code repository and start build the process.
4. As soon as Jenkins finish building image, Jenkins pushes the image to Harbor private repository (Take note to configure the git push job settings from "Git publisher" as "push only if build succeeds", by this way only successfull builds will be pushed);
5. Jenkins makes changes to the deployment file repository, which contains the Kubernetes deployment configurations needed for the application.
6. ArgoCD sync the most recent update from the deployment source;
7. With synced functions and modifications, ArgoCD apply these modifications and start the deployment the application on Kubernetes that create the necessary application pods and service as defined on deployment file;


<h3>Jenkins Build Image and Image Push</h3>

<img src="https://github.com/Josemyr1993/jenkins_argo_cd_harbor_docker_kubernetes/blob/main/jenkins_build.gif" heigh="1000" width="1000">
<br>

<h3>Harbor Image Check</h3>

<img src="https://github.com/Josemyr1993/jenkins_argo_cd_harbor_docker_kubernetes/blob/main/harbor_image.gif" heigh="1000" width="1000">
<br>

<h3>ArgoCD Sync And Deployment Process</h3>

<img src="https://github.com/Josemyr1993/jenkins_argo_cd_harbor_docker_kubernetes/blob/main/argocd_image.gif" heigh="1000" width="1000">

:label: At this point we execute sync manually to force deployment of new pods by calling a kubernetes option in ArgoCD (--force);
<br>
Deployment creates components like: replicaset, pods (by replicas values defined), service Loadbalancer type and an external IP for our application access;

<br>
<h3>Kubernetes workloads validation and Web Application Validation</h3>

<img src="https://github.com/Josemyr1993/jenkins_argo_cd_harbor_docker_kubernetes/blob/main/k8s_image.gif" heigh="1000" width="1000">
<br>

<h3>References</h3>
<i>Tanmay Bhandge - How to build and deploy applications on Kubernetes.</i><br>
<i>ArgoCD Official Documentation.</i><br>
<i>Harbor Official Documentation.</i>
