resource "null_resource" "kubectl" {
depends_on = [
    resource.aws_iam_role.eks_cluster
]    
provisioner "local-exec" {
command = "aws eks --region eu-west-1 update-kubeconfig --name NS_cluster"
}
}
