# AKS with Advanced Networking

![Azure Terraform](https://github.com/J0hn-B/azure_terr_env/workflows/Azure%20Terraform/badge.svg)

An AKS Cluster with linux vms on a separate subnet.  
Advanced networking allows containers from inside the cluster to communicate with the vms.  
Virtual Machines can be accessed from bastion with SSH or Password, check the variables.tf to dynamically change the number of vms.
SSH keys and passwords are stored to a separate Azure Key Vault.  
Basic AzureAD manifests for AzureAD configuration.
