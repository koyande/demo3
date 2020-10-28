### Provider Block ###

provider "okta" {
  org_name  = "cross-dev-874180"
  base_url  = "okta.com"
  api_token = var.okta_api_token
}

### Group Block ###
resource "okta_group" "test11" {
 name        = var.okta_group_name
 description = var.okta_group_description
}

