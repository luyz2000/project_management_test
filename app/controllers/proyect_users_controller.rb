class ProyectUsersController < ApplicationController
  before_action :set_proyect
  before_action :set_proyect_user, only: %i[ show edit update destroy ]

  # GET /proyect_users or /proyect_users.json
  def index
    @proyect_users = @proyect.proyect_users
  end

  # GET /proyect_users/1 or /proyect_users/1.json
  def show
  end

  # GET /proyect_users/new
  def new
    @proyect_user = @proyect.proyect_users.build
  end

  # GET /proyect_users/1/edit
  def edit
  end

  # POST /proyect_users or /proyect_users.json
  def create
    @proyect_user = @proyect.proyect_users.new(proyect_user_params)

    respond_to do |format|
      if @proyect_user.save
        send_invitation_email
        format.html { redirect_to proyect_proyect_users_url(@proyect), notice: "Proyect user was successfully created." }
        format.json { render :show, status: :created, location: @proyect_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proyect_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyect_users/1 or /proyect_users/1.json
  def update
    respond_to do |format|
      if @proyect_user.update(proyect_user_params)
        format.html { redirect_to proyect_proyect_users_url(@proyect), notice: "Proyect user was successfully updated." }
        format.json { render :show, status: :ok, location: @proyect_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proyect_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyect_users/1 or /proyect_users/1.json
  def destroy
    @proyect_user.destroy

    respond_to do |format|
      format.html { redirect_to proyect_proyect_users_url(@proyect), notice: "Proyect user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyect
      @proyect = Proyect.find(params[:proyect_id])
    end

    def set_proyect_user
      @proyect_user = @proyect.proyect_users.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proyect_user_params
      params.require(:proyect_user).permit(:user_id, :role)
    end

    def send_invitation_email
      ProyectUserMailer.with(proyect_user: @proyect_user).invitation_to_proyect.deliver_later
    end
end
