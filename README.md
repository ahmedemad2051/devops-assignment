# devops-assignment

- Install EKS on AWS via terraform

---

###  Install EKS on AWS via terraform:

2- Requirements: 
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

![TF_INIT](https://github.com/ahmedemad2051/devops-assignment/blob/main/EKS-with-terraform/readme_images/Screenshot%20from%202021-03-11%2012-59-27.png)



Provision your EKS cluster by running 
```bash
$ terraform apply -var-file dev.tfvars
```

![TF_APPLY](https://github.com/ahmedemad2051/devops-assignment/blob/main/EKS-with-terraform/readme_images/Screenshot%20from%202021-03-11%2018-48-11.png)


In AWS Console You can see resources that created via terraform: 
![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/EKS-with-terraform/readme_images/Screenshot%20from%202021-03-11%2018-49-09.png)
![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/EKS-with-terraform/readme_images/Screenshot%20from%202021-03-11%2018-49-41.png)

---

### configure kubectl:

This command will get the access credentials for your cluster and automatically configure kubectl.

```bash
$ aws eks --region eu-north-1 update-kubeconfig --name first_cluster
```

![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/EKS-with-terraform/readme_images/Screenshot%20from%202021-03-11%2018-51-02.png)

### check cluster is ready:

```bash
$ kubectl get nodes
```

![console](https://github.com/ahmedemad2051/devops-assignment/blob/main/EKS-with-terraform/readme_images/Screenshot%20from%202021-03-11%2018-51-11.png)
