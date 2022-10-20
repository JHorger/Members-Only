# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # # GET /resource/sign_in
  def new
    # super
    @user = current_user
  end

  # # POST /resource/sign_in
  def create
    # super
    user = User.find_by_email(user_params[:email])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Successfully logged in!"
    else
      flash.now.alert = "Email or password is invalid, please try again."
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /resource/sign_out
  def destroy
    # super
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  private

  def user_params
    params.require(:user).permit(:user)
  end
end
