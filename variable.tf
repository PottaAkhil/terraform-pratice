variable "cidr"{
  type        = string
}

variable "public_Subnet"{
  type        = string
}

variable "private_Subnet"{
  type        = string   
}

variable "routtable_cidr" {
  type =  string
  
}

variable "key_name" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}