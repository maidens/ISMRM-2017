# ISMRM-2017
Code and data to generate figures from the abstract "Spatio-temporally constrained reconstruction for hyperpolarized carbon-13 MRI using kinetic models" that was ultimately not submitted. 

Requires the following python packages:
* numpy
* scipy
* matplotlib
* ipyparallel
* prox_tv (https://github.com/albarji/proxTV)

Since I found the prox_tv package challenging to install, you can save time by running this notebook using a preconfigured AWS cloud server. Email me (my-github-handle at eecs.berkeley.edu) with your AWS account number to request access. 

1) Start an Amazon EC2 instance 
* Use the "ubuntu-python-jupyter-prox_tv-ipyparallel" machine image (AMI) 
             this machine is saved in the eu-west-1a availability zone 
* Configure the networking to allow all TCP 

2) Connect to the instance 
* Get the public DNS for the instance, for example: 
      `ec2-54-171-77-111.eu-west-1.compute.amazonaws.com`
* Connect via SSH using the aws_ireland key, for example: 
      `ssh -i ~/aws_tutorial/aws_ireland.pem ubuntu@ec2-54-171-77-111.eu-west-1.compute.amazonaws.com`

3) Start a parallel computing cluster: 
* For example a cluster with 4 engines can be started using the command: 
      `ipcluster start -n 4 &`

4) Start and connect to a Jupyter notebook server
* Start a notebook server using the command:
             `jupyter notebook `
* Open a browser window and navigate to the notebook, for example enter the address:
             https://ec2-54-171-77-111.eu-west-1.compute.amazonaws.com:8888
* Depending on your browser security settings, you may need to make a security exception in order to connect
* Enter the notebook server password: *****

5) Upload the notebook and the data set to the server using the graphical interface 

6) Run the notebook 
