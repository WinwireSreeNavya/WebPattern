#Create KeyVault ID
resource "random_id" "kvname" {
  byte_length = 7
  prefix = "keyvault"
}
