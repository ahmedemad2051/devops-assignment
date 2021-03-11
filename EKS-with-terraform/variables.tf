################### provider ##############
variable "provider_region" {
  type    = string
}

############ vpc ######################
variable "vpc_cidr" {
  type    = string
}

variable "vpc_tag" {
  type    = string
}

########## public subnet 1 #############
variable "pub_sub_1_cidr" {
  type    = string
}

variable "pub_sub_1_zone" {
  type    = string
}

variable "pub_sub_1_tag" {
  type    = string
}


########## public subnet 2 #############
variable "pub_sub_2_cidr" {
  type    = string
}

variable "pub_sub_2_zone" {
  type    = string
}

variable "pub_sub_2_tag" {
  type    = string
}

########## private subnet 1 #############
variable "pv_sub_1_cidr" {
  type    = string
}

variable "pv_sub_1_zone" {
  type    = string
}

variable "pv_sub_1_tag" {
  type    = string
}

########## private subnet 2 #############
variable "pv_sub_2_cidr" {
  type    = string
}

variable "pv_sub_2_zone" {
  type    = string
}

variable "pv_sub_2_tag" {
  type    = string
}

############### eks ##################
variable "cluster_name" {
  type    = string
}
