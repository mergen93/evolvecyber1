resource "aws_iam_user" "bob" {
  name = "bob"
  tags = local.common_tags

}

resource "aws_iam_user" "sam" {
  name = "sam"
  tags = local.common_tags

}

resource "aws_iam_group" "december" {
  name = "december"
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.bob.name,
    aws_iam_user.sam.name,
  ]

  group = aws_iam_group.december.name
}



resource "aws_iam_user" "more-users" {
  name = each.key
  for_each = toset([
    "user1",
    "user2",
    "user3",
  ])
}