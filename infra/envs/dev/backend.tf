terraform {
  cloud {
    organization = "winwire"
    workspaces {
      name = "tfdeploy"
    }
  }
}
