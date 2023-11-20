cidr = "10.10.0.0/16"
public_Subnet = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24","10.10.7.0/24", "10.10.8.0/24", "10.10.9.0/24"]
private_Subnet = ["10.10.4.0/24", "10.10.5.0/24", "10.10.6.0/24"]
routtable_cidr = "0.0.0.0/0"
key_name = "terraformnew"
number = "1"
availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c","ap-south-1a", "ap-south-1b", "ap-south-1c"]
rules =  [
    {
      port        = 80
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 22
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 3689
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

eks_cluster_name = "test-cluster"
resource_tags =  { 
    "env"        = "dev"
    "project"    = "Akhil"
    "Iaac"       = "Terraform"
  }

region = "ap-south-1"