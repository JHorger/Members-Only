class UsersController < ApplicationController
    def index
        @users = current_user
    end

    def new
        @user = User.new
    end

    def create
        # super
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.user_id
          redirect_to root_path, notice: "Thanks for signing up!"
        else
          render :new, status: :unprocessable_entity
        end
    end


    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end