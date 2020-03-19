# TerraformSentry
Deploy sentry on AWS using terraform

To initialize a working directory containing Terraform configuration files.

        terraform init
To let terraform to create an execution plan.

        terraform plan
To apply the changes required to reach the desired state of the configuration

        terraform apply

Note: AWS credentials must be configured.

        aws configure
        EXPORT Access key ID = XXXXXXXXXXXXXX
        EXPORT Secret access key = XXXXXXXXXXXX

Components:

**Components:**
   - `variables.tf` conatians all the variables required in the module.
   - `connections.tf` specifies the aws connection provider.
   - `main.tf` contains resource code to launch instance
   - `userdata.sh` guide on setting up sentry 
   
**Note**: Sentry hardware requirements minimum 2 CPU, 4GB RAM.

   On using t2.micro the instarnce freezes on running dokcer web upgrade because of resource constraints.
   
   - Recomended Instance type:
      - t2.xlarge 4 CPUS, 16GB RAM   
   - Minimum
      - t2.medium 2 CPUS, 4GB RAM
      
**Sentry Home Page:**
   
   Creating user account is optional hence it is skipped in the script
       
       "yes n | sudo docker-compose run --rm web upgrade"
       
   Otherwise on user account creation.
