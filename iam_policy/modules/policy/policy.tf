data "aws_iam_policy_document" "document" {
  statement {
    sid = "EssentialStatement"
    principals {
      type = "AWS"
      // https://dev.classmethod.jp/articles/aws-account-example-id-by-documents/
      identifiers = [
        "arn:aws:iam::123456789012:root",
      ]
    }
    actions = [
      "s3:GetObject",
    ]
    resources = [
      "arn:aws:s3:::example-bucket/*",
    ]
  }

  dynamic "statement" {
    for_each = var.additional_policy_statements
    content {
      sid = statement.value.sid
      dynamic "principals" {
        for_each = statement.value.principals
        content {
            type = principals.value.type
            identifiers = principals.value.identifiers
        }
      }

      effect = statement.value.effect
      actions = statement.value.actions
      resources = statement.value.resources

      dynamic "condition" {
        for_each = statement.value.conditions
        content {
          test = condition.value.test
          variable = condition.value.variable
          values = condition.value.values
        }
      }
    }
  }
}