### Provider Block ###

provider "okta" {
  org_name  = "dev-874180"
  base_url  = "okta.com"
  api_token = "00RYrmQkTDObLczhYfut1by_U1Tn-E8JX5Fm1Re5IG"
}

### Group Block ###
resource "okta_group" "test11" {
 name        = var.okta_group_name
 description = var.okta_group_description
}

