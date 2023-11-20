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
          command = "aws eks --region ${var.region} update-kubeconfig --name ${var.eks_cluster_name}"
          }
       depends_on = [ aws_eks_cluster.cluster ]
   }

resource "null_resource" "manifest" {
      provisioner "local-exec" {
        command = "kubectl annotate serviceaccount cluster-autoscaler -n kube-system eks.amazonaws.com/role-arn=${aws_iam_role.autoscaller.arn}"
           }
    depends_on = [
      data.kubectl_path_documents.docs, aws_iam_role.autoscaller, kubectl_manifest.test, null_resource.kubectl ]
}
