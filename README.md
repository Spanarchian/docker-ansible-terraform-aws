# docker-ansible-terraform-aws
Deploying 2 Docker hello world applications in HA mode using nginx as LB and AWS as cloud provider and ansible as orchestrator and terraform for IaC

This Project will get you started with terraform , aws , ansible and  docker 

Step at Highlevel:
Install Terraform ( downlaod https://www.terraform.io/downloads.html) 
Configure terraform
Create 3 aws Ec2 nodes using terraform 
Install ansible on 1 aws ec2 node 
using ansible install docker & any other prereq on all 3 hosts
Deploy the https://hub.docker.com/r/tutum/hello-world/ service in HA  using Ansible
Loadbalancer : aws ec2 -> nginx-host
App Nodes 	 :  aws ec2->hello_world_host aws ec2->hello_world_host

Prerequistes for this Project :
1. Valid AWS account 
if you dont have AWS account , then you can create free tier account one by signing up on https://aws.amazon.com/  
2. make sure to  create "AWS Access Key ID &  AWS Secret Access Key" , these keys will be used by terraform  for creating and deletion of AWS instances 
3. create ssh key pair which will be used to do ssh to ec2 nodes , download key.pem file and use it during ansible execution 
4. ssh-keyscan might be required for 3 hosts from ansible host to avoid know hosts checking during ansible execution 

Steps to get Started:

Installing Terraform:

1. Downlaod required setup from https://www.terraform.io/downloads.html

2. Linux installer i have uploaded in repo as well terraform_0.9.8_linux_amd64.zip 

3. sudo yum install unzip -y
   unzip terraform_0.9.8_linux_amd64.zip
   sudo ln -s /home/ec2-user/terraform /usr/bin/terraform
   type command "terraform"  to validate terraform has been installed and is in path 
   
 4.Once terraform is installed the we are ready to get started 
 
 5.Use script/template aws_ec2_creation_template.tf to create aws ec2 node using below command 
    https://www.terraform.io/intro/getting-started/build.html
    Commands to be typed from Scripts directory :
    cd Scripts
    terraform plan
    terraform apply
    terraform show
    
 6. terraform show will give you required IPs of ec2 hosts created , take public_ip from each output and update in all hosts files as       required
 
 7. Install ansible using script InstallAnsible.sh on any host , say on nginx-host
     ./InstallAnsible.sh 
 
 8. Install Docker related prereq using below command from machine (nginx-host) where ansible is installed 
     ansible-playbook InstallPy.yml -i Hosts -vvv
     
 9. Install Docker  using below command from machine (nginx-host) where ansible is installed  (Docker_Repo_Pre_Req.sh might need to be       excuted in case docker is not present in default repo on target ost machines)
    
      ansible-playbook InstallDockerPlay.yml  -i Hosts -vvv
     
10. Install/deploy 2  hello world applications using tutum docker image  using below command from machine (nginx-host) where ansible         is installed 
      
      ansible-playbook PullDockerHello.yml  -i Host_helloworld_1.ini -vvv
      ansible-playbook PullDockerHello2.yml -i Host_helloworld_2.ini -vvv
  
  11.  Install/deploy  nginx Lb docker image  using below command from machine (nginx-host) where ansible is installed 
      
        ansible-playbook PullDockerNginx.yml -i Host_Nginx.ini -vvv
      
      
 
 
