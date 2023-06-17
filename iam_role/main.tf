# 信頼ポリシー
# ec2サービスにのみ関連付けさせられる
data "aws_iam_policy_document" "assume_role" {
    statement {
        actions = ["sts:AssumeRole"]
        principals {
            type = "Service"
            identifiers = [var.identifier]
        }
    }
}

# ロール名と信頼ポリシーを指定
resource "aws_iam_role" "example" {
    name = var.name
    assume_role_policy = data.aws_iam_policy_document.assume_role.json
}


# policy作成
resource "aws_iam_policy" "default" {
  name        = var.name
  policy = var.policy
}

# IAMロールにポリシーをアタッチ
resource "aws_iam_role_policy_attachment" "example" {
    role = var.name
    policy_arn = aws_iam_policy.default.arn
}

output "iam_role_arn" {
  value = aws_iam_role.example.arn
}

output "iam_role_name" {
  value = aws_iam_role.example.name
}