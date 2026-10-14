# Creates the S3 bucket that holds Terraform state for the other stacks.
# Applied once with local state; then its own state is moved into the bucket (see ../README.md).
data "aws_caller_identity" "current" {}

module "state_bucket" {
  source = "../modules/state-bucket"

  bucket_name = "app-tfstate-${data.aws_caller_identity.current.account_id}-use1"
}
