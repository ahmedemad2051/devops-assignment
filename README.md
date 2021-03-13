# devops-assignment

- Install EKS on AWS via terraform
- Install Jenkins, SonarQube and Nexus via ansible
- Implement a CICD pipeline for a python application

---

###  Install EKS on AWS via terraform:

1- Requirements: 
* Terraform
* AWScli
* Wget
* [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

2- Setting up AWS IAM user for Terraform: 
* create an AWS IAM user and give it:
  * AdministratorAccess

After these steps, AWS will provide you a Secret Access Key and Access Key ID. Then run aws configure and add the credentials

After you've done this, initalize your Terraform workspace, which will download the provider and initialize it with the values provided in the **terraform.tfvars** file by running 
```bash
$ terraform init
``` 

![TF_INIT](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-11%2012-59-27.png)



Provision your EKS cluster by running 
```bash
$ terraform apply -var-file dev.tfvars
```

![TF_APPLY](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-11%2018-48-11.png)


In AWS Console You can see resources that created via terraform: 
![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-11%2018-49-09.png)
![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-11%2018-49-41.png)

---

### configure kubectl:

This command will get the access credentials for your cluster and automatically configure kubectl.

```bash
$ aws eks --region eu-north-1 update-kubeconfig --name first_cluster
```

![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-11%2018-51-02.png)

### check cluster is ready:

```bash
$ kubectl get nodes
```

![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-11%2018-51-11.png)

###  Install Jenkins, SonarQube and Nexus via ansible:
 Install ansible
```bash
$ pip3 install --user ansible
```
 Install openshift so you can use k8s module in ansible
```bash
$ pip3 install --user openshift
```
 Run the ansible playbook
```bash
$ ansible-playbook ansible/playbook.yaml
```
![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-12%2011-09-43.png)

Now if you run the below command you can see the deployments applied
```bash
$ kubectl get all -n tools
```
![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-12%2011-12-37.png)

To open Jenkins,SonarQube or Nexus run below command then open any EXTERNAL-IP (LoadBalancer endpoint) in browser
```bash
$ kubectl get svc -n tools
```
![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-12%2013-41-18.png)

To open Jenkins run
```bash
$ kubectl exec -n tools [jenkins-pod-name] -- cat /var/jenkins_home/secrets/initialAdminPassword
```
![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-12%2013-42-44.png)

![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-12%2013-55-42.png)

![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-12%2013-55-57.png)

![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-12%2014-01-06.png)

![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-12%2014-01-45.png)

To open SonarQube use default user:admin and password:admin

![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-12%2014-08-58.png)

Nexus

![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-12%2013-49-15.png)

###  Implement a CICD pipeline for a python application:
Requirements Plugins
* Github Integration
* Docker
* Docker pipeline

Create a pipeline job on Jenkins

![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-12%2019-09-36.png)

Add the repo URL and Jenkinsfile path

![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-12%2019-13-06.png)

First you should configure Jenkins to use kubectl 
Go inside Jenkins container first by run

```bash
$ kubectl exec -it  [jenkins-pod-name] -n tools bash
```
Configure AWS credentials (hint: this should be done by attach IAM role to the nodes)

```bash
$ aws configure
```
![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-13%2010-49-24.png)

Run below command so you can use kubectl

```bash
$ aws eks --region eu-north-1 update-kubeconfig --name first_cluster
```
![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-13%2010-50-10.png)

Now you can build the pipeline

![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-13%2012-16-32.png)

![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/readme_images/Screenshot%20from%202021-03-13%2012-15-48.png)




