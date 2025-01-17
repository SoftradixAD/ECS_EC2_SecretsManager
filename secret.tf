resource "aws_secretsmanager_secret" "rds_credentials" {
  name        = "rds_mysql_credentials"
  description = "RDS MySQL credentials for the database instance"
}

resource "random_password" "rds_password" {
  length  = 16           # Length of the password
  special = true         # Include special characters
  upper   = true         # Include uppercase letters
  lower   = true         # Include lowercase letters
  numeric  = true         # Include numbers
}

resource "aws_secretsmanager_secret_version" "rds_credentials_version" {
  secret_id     = aws_secretsmanager_secret.rds_credentials.id
  secret_string = jsonencode({
    username = "admin"
    password = random_password.rds_password.result  # Change to a secure password
  })
}