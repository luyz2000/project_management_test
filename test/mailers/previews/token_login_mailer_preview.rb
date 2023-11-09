# Preview all emails at http://localhost:3000/rails/mailers/token_login_mailer
class TokenLoginMailerPreview < ActionMailer::Preview
  def magic_login_email
    user = User.first
    user.generate_login_token!
    TokenLoginMailer.with(user: user).magic_login_email
  end
end
