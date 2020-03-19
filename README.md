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

variables.tf conatians all the variables required in the module.
connections.tf specifies the aws connection provider.
