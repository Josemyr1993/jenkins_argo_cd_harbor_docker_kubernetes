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
4. As soon as Jenkins finish building image, Jenkins pushes the image to Harbor private repository (Take note to configure the push job the settings "Git publisher" as "push only if build succeeds", by this way you'll not push images/settings with errors).
5. Jenkins makes changes to the deployment file repository, which contains the Kubernetes deployment configurations needed for the application.
6. ArgoCD sync the most recent update from the deployment source;
7. With synced functions and modifications, ArgoCD apply these modifications and start the deployment the application on Kubernetes that create the necessary application pods as defined on deployment file;


<h3>Jenkins Build Image and Image Push</h3>

<h3>Harbor Image Check</h3>

<h3>ArgoCD Sync And Deployment Process</h3>

<h3>Kubernetes Validation workloads</h3>

<h3>Web Application test from Browser</h3>


