terraform {
  experiments = []
}
module "api-cloud-keyvault" {
  source = "./modules/cloud_keyvault1"
}
