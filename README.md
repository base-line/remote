# remote
This is an example how to migrate your local state to remote backend - Terraform Cloud

## Pre-requirements
- [git](https://git-scm.com/downloads) need to be installed 
- [terraform](https://www.terraform.io/downloads.html) need to be installed

## How to consume

```bash
git clone git@github.com:base-line/remote.git
cd remote
terraform init
terraform apply
```

# Initially

this is initial code in `main.tf`

```bash
resource "null_resource" "helloWorld" {
  provisioner "local-exec" {
    command = "echo hello world"
  }
}
```

## Modify the configuration

add this to beginning 

```bash
terraform {
  backend "remote" {
    organization = "popa-org"

    workspaces {
      name = "remote"
    }
  }
}
```

on `terraform apply` and get

```bash
Backend reinitialization required. Please run "terraform init".
Reason: Initial configuration of the requested backend "atlas"

The "backend" is the interface that Terraform uses to store state,
perform operations, etc. If this message is showing up, it means that the
Terraform configuration you're using is using a custom configuration for
the Terraform backend.

Changes to backend configurations require reinitialization. This allows
Terraform to setup the new configuration, copy existing state, etc. This is
only done during "terraform init". Please run that command now then try again.

If the change reason above is incorrect, please verify your configuration
hasn't changed and try again. At this point, no changes to your existing
configuration or state have been made.


Error: Initialization required. Please see the error message above.
```

re-run `terraform init` and migrate to new backend 

```

Initializing the backend...
Do you want to copy existing state to the new backend?
  Pre-existing state was found while migrating the previous "local" backend to the
  newly configured "remote" backend. No existing state was found in the newly
  configured "remote" backend. Do you want to copy this state to the new "remote"
  backend? Enter "yes" to copy and "no" to start with an empty state.

  Enter a value:
```

## Destroy

destroy created infrastructure if need be

```
terraform destroy
```
