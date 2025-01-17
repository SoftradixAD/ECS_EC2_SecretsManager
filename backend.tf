terraform {
  backend "s3" {
    bucket         = "local-dropbox-backup"
    key            = "local-dropbox-backup/state/terraform.tfstate" # Specify the path within the bucket
    region         = "ap-south-1"
    # dynamodb_table = "<your-lock-table-name>"    # Optional: For state locking
    encrypt        = true                        # Encrypt the state file at rest
  }
}
