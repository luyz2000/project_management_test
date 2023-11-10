class ProyectUserMailer < ApplicationMailer

  def invitation_to_proyect
    @proyect_user = params[:proyect_user]
    @user = @proyect_user.user

    mail(
      to: @user.email,
      subject: "#{@proyect_user.proyect.owner&.name} te invito a su proyecto",
    )
  end

end
