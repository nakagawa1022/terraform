data "aws_iam_policy_document" "allow_describe_regions" {
    statement {
        effect = "Allow" # 誰が
        actions = [
        "ec2:DescribeRegions",
        ] # 何のサービスで:などんな操作ができるのか
        resources = ["*"] # どのリソースに対して
    }
}

module "describe_regions_for_ec2" {
    source = "./iam_role"
    name = "describe_regions_for_ec2"
    policy = data.aws_iam_policy_document.allow_describe_regions.json
    identifier = "ec2.amazonaws.com"
}

