terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

# variable "bswt_website_bswt_user_private_key_secret_key" {
#   type = string
#   default = "prod/bswt-website/bswt-user"
# }

# # for this to work, you will obviously need to have already created the secret.
# # this is outside the scope of our automation
# data "aws_secretsmanager_secret" "bswt_website_bswt_user_private_key_secret" {
#   name = var.bswt_website_bswt_user_private_key_secret_key
# }

# data "aws_secretsmanager_secret_version" "bswt_website_bswt_user_private_key_secret_current" {
#   secret_id = data.aws_secretsmanager_secret.bswt_website_bswt_user_private_key_secret.id
# }

# resource "local_file" "bswt_website_bswt_user_private_key_file" {
#     content = data.aws_secretsmanager_secret_version.bswt_website_bswt_user_private_key_secret_current.secret_string
#     filename = "/tmp/bswt_website_bswt_user_private_key_secret.rsa"
# }

# resource "aws_lightsail_key_pair" "bswt_website_lightsail_key_pair" {
#     name = "bswt_website"
#     # public_key = data.aws_secretsmanager_secret_version.bswt_website_bswt_user_private_key_secret_current.secret_string
#     # public_key = file("/tmp/bswt_website_bswt_user_private_key_secret.rsa")
#     public_key = local_file.bswt_website_bswt_user_private_key_file.content
# }

# resource "local_file" "bswt_website_bswt_user_private_key_file" {
#     content = data.aws_secretsmanager_secret_version.bswt_website_bswt_user_private_key_secret_current.secret_string
#     filename = "/tmp/bswt_website_bswt_user_private_key_secret.rsa"
# }

resource "aws_cloudformation_stack" "bswt_website" {
  name = "bswt-website"

  template_body = file("${path.module}/../cloudformation/bswt-website.yaml")
}