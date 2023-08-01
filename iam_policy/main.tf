locals {
  statement = {
    principals = [{
      type = "AWS"
    }]
    sid = "AdditionalPolicyStatement"
    effect = "Allow"
    actions = ["s3:ListBucket"]
    resources = ["*"]
  }
}

module "policy" {
  source = "./modules/policy"
  additional_policy_statements = [
    local.statement
  ]
}