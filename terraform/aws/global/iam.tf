/** IAM User **/
resource "aws_iam_user" "dsk" {
  name = "dsk"
  path = "/"
}

resource "aws_iam_user" "yuki" {
  name = "yuki"
  path = "/"
}

resource "aws_iam_user" "takashi" {
  name = "takashi"
  path = "/"
}

/** IAM Group **/
resource "aws_iam_group" "admin" {
  name = "admin"
  path = "/"
}

/** IAM Group Membership **/
resource "aws_iam_group_membership" "admin" {
  name = "admin-group-group-membership"

  users = [
    "${aws_iam_user.dsk.name}",
    "${aws_iam_user.yuki.name}",
    "${aws_iam_user.takashi.name}",
  ]

  group = "${aws_iam_group.admin.name}"
}

/** IAM Group Policy **/
resource "aws_iam_group_policy" "admin" {
  name  = "admin"
  group = "${aws_iam_group.admin.name}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
POLICY
}

/** IAM Passsword policy **/
resource "aws_iam_account_password_policy" "admin" {
  minimum_password_length        = 8
  allow_users_to_change_password = true
}
