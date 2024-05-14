resource "aws_cognito_user_pool" "example" {
  name = "my-user-pool"

  # Define policies
  password_policy {
    minimum_length    = 8
    require_lowercase = false
    require_numbers   = true
    require_symbols   = false
    require_uppercase = false
  }

  # Define email configuration
  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"  # or "DEVELOPER"
  }
}

output "user_pool_id" {
  value = aws_cognito_user_pool.example.id
}
