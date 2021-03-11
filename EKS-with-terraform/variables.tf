################### provider ##############
variable "provider_region" {
  type    = string
}

############ vpc ######################
variable "vpc_cidr" {
  type    = string
}


########## public subnets #############
variable "pub_subnets" {
  type    = list(string)
}

########## private subnets #############

variable "pv_subnets" {
  type    = list(string)
}


############### eks ##################
variable "cluster_name" {
  type    = string
}
