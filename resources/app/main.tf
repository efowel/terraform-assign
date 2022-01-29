terraform {
  backend "s3" {
  }
  required_providers {
    aws = {
      source        = "hashicorp/aws"
      version       = "3.67.0"
    }
  }
  required_version  = "~> 1.1"
}

provider "aws" {
  region       = var.region
}

data "terraform_remote_state" "vpc" {
  backend           = "s3"
  workspace         = "dev"
  config = {
      bucket        = var.bucket
      key           = "resources/DEV/infra.tfstate"
      region        = var.region
  }
}

module "alb" {
  source                = "./compute/alb"
  project               = var.project
  vpc_id                = data.terraform_remote_state.vpc.outputs.vpc_id
  name                  = var.alb_name 
  subnets               = data.terraform_remote_state.vpc.outputs.subnet_pub_id
  internal              = false  
}

module "nginx-static" {
  source                = "./compute/autoscale"
  project               = var.project
  vpc_id                = data.terraform_remote_state.vpc.outputs.vpc_id
  name                  = var.name_nginx
  image_id              = var.image_id_nginx
  key_name              = var.key_name
  instance_type         = var.instance_type
  desired_capacity      = var.desired_capacity
  max_size              = var.max_size
  min_size              = var.min_size
  tg_port               = 80
  vpc_zone_identifier   = data.terraform_remote_state.vpc.outputs.subnet_priv_id
}
