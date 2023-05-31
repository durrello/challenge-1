# challenge 1 - Terraform on GCP

## Description
You are tasked to deploy a web application on Google Cloud Platform (GCP) using Terraform. The webapplication should consist of the following components:
• A Compute Engine instance running a Linux operating system (Ubuntu 20.04 LTS).
• A load balancer that distributes incoming traffic to the Compute Engine instance.
• A firewall rule that allows HTTP (port 80) and HTTPS (port 443) traffic to the load balancer.
You can assume that the following prerequisites have already been completed:
• You have a GCP account with billing enabled.
• You have created a GCP project and have enabled the necessary APIs.
• You have set up a service account with the necessary permissions to create and manage resources.
• You have installed Terraform on your machine.

Note: You may encounter some errors or issues while completing this exercise. Please document any errors or issues you encounter, along with the steps you took to resolve them

## Solution 
### prerequisite
• You have git installed

• You have terraform installed

• You have a Google Cloud Platform (GCP) account

• You have a service account json key

#### step 1: clone the repo
 git clone https://github.com/durrello/challenge-1.git
 
#### step 2: run the project
###### cd challenge-1

###### terraform init 

###### terraform apply

After it's done deploying, the example will output URLs or IPs to try out.

To clean up and delete all resources after you're done, run 
###### terraform destroy

### Issues faces and how I resolved them
Missing service account credentials: Fixed by specifying the service account JSON file in the provider config.

Missing region: Specified "us-central1" as the default GCP region.

Provider configuration errors - Fixes are:
Specify required configuration (region, credentials, project ID, etc.)
Enable necessary APIs

testing ssh keyss