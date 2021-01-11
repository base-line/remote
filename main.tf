terraform {
  backend "remote" {
    organization = "popa-org"

    workspaces {
      name = "remote"
    }
  }
}

resource "null_resource" "helloWorld" {
  provisioner "local-exec" {
    command = "echo hello world"
  }
}
