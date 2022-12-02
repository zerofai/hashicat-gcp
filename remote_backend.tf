terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "zerofai-tcs"
    workspaces {
      name = "hashicat-gcp"
    }
  }
}
