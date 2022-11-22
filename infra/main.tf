terraform {
  experiments = [module_variable_optional_attrs]
}
module "api-cloud-keyvault" {
  source = "./modules/cloud_keyvault"
}
