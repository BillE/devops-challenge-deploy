# Values that are likely to change
variable "aws_ecr_repo_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "903874664894.dkr.ecr.us-west-2.amazonaws.com/devops-challenge"
}

variable "app_image_tag" {
    description = "Tag for container image"
    type        = string
    default     = "latest"
}

variable "aws_region" {
    description = "Region in AWS where app will be deployed"
    type = string
    default = "us-west-2"

}

variable "aws_zone" {
  description = "Zone in AWS regin where app will be deployed"
  type = string
  default = "us-west-2b"
}