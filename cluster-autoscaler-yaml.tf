data "kubectl_path_documents" "docs" {
     pattern = "./manifest/*.yml"
 }
 
 resource "kubectl_manifest" "test" {
     for_each  = toset(data.kubectl_path_documents.docs.documents)
     yaml_body = each.value
     depends_on = [
       null_resource.kubectl,
     ]
 }

 resource "null_resource" "kubectl" {
   provisioner "local-exec" {
     command  = "aws eks --region ${var.region} update-kubeconfig --name ${var.eks_cluster_name}"
           }
        depends_on = [ aws_eks_cluster.cluster ]
    }

 resource "null_resource" "apply" {
   provisioner "local-exec" {
     command = "kubectl apply -f C:/Users/91831/Downloads/terraform-pratice/manifest/cluster-autoscaler.yml"
   }
        depends_on = [ aws_eks_cluster.cluster ]
    }