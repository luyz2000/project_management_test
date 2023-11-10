class TokenLoginsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index create]

  def index
    redirect_to root_path unless params[:token].present?

    user = User.find_by(login_token: params[:token])
    if user
      bypass_sign_in(user)
      user.update_column(:login_token, nil)
      redirect_to root_path, notice: 'Logged in successfully!'
    else
      redirect_to new_token_login_path, alert: 'The link you used was invalid. Please request a new login link'
    end
  end

  def new; end

  def create
    user = User.find_by(email: user_params[:email])

    if user
      user.generate_login_token!
      send_token_email(user)
      redirect_to(new_token_login_path, notice: 'Please check your inbox')
    else
      redirect_to(new_token_login_path, alert: 'It looks like that email is not registered')
    end
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end

  def send_token_email(user)
    TokenLoginMailer.with(user: user).magic_login_email.deliver_later
  end
end
