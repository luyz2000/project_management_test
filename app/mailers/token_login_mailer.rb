class TokenLoginMailer < ApplicationMailer

  def magic_login_email
    user = params[:user]
    @magic_login_url = token_logins_url(token: user.login_token)

    mail(
      to: user.email,
      subject: "Aqui esta tu enlace para iniciar sesion",
    )
  end

end
