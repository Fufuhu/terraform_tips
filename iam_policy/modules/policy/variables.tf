variable "additional_policy_statements" {
  type = list(object({
    sid = optional(string)
    principals = optional(list(object({
      type = optional(string, "AWS")
      identifiers = optional(list(string), ["*"])
    })))
    effect = optional(string, "Allow")
    actions = optional(list(string), [])
    resources = optional(list(string), [])
    conditions = optional(list(object({
      test = string
      variable = string
      values = list(string)
    })),[])
  }))

  default = []
}