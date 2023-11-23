# data "kubectl_path_documents" "docs" {
#     pattern = "./manifest/*.yml"
# }
 
# resource "kubectl_manifest" "test" {
#     for_each  = toset(data.kubectl_path_documents.docs.documents)
#     yaml_body = each.value
#     depends_on = [
#       null_resource.kubectl,
#     ]
# }

# resource "null_resource" "kubectl" {
#   provisioner "remote-exec" {
#     inline  = ["aws eks --region ${var.region} update-kubeconfig --name ${var.eks_cluster_name}"]
#           }
#        depends_on = [ aws_eks_cluster.cluster ]
#    }

# resource "null_resource" "apply" {
#   provisioner "remote-exec" {
#     inline = [
#       "kubectl apply -f C:/Users/Akhil/Downloads/terraform-practice/manifest/cluster-autoscaler.yml",
#       # Add any other necessary configuration commands
#     ]
#   }
#        depends_on = [ aws_eks_cluster.cluster ]
#    }