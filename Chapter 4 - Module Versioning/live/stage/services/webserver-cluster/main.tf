// setup provider
provider "aws" {
    region = "ca-central-1"
}

terraform {
    backend "s3" {
        key = "stage/services/webserver-cluster/terraform.tfstate"
    }
}

module "webservercluster" {
    source  = "DuffMan2020/webservercluster/aws"
    version = "0.0.2"
    # insert the 7 required variables here
    cluster_name = "ddt-webserver-stage"
    db_remote_state_bucket = "ddt-terraform-state"
    db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate" 
    db_remote_state_region = "ca-central-1"
    instance_type = "t2.micro"
    min_size = 2
    max_size = 2
}



