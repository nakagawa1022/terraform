variable "name" {
    description = "IAMロール名"
    type = string
}

variable "policy" {
    description = "IAMポリシー"
    type = string
}

variable "identifier" {
    description = "IAMロールに関連付けるサービス"
    type = string
}
