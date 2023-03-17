class UserRegistrationsController < ApplicationController
    skip_before_action :require_login, only: %i[ new create ]
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)

      if @user.save
        auto_login(@user)
        redirect_to dashboard_path, notice: "You successfully registered"
      else
        flash.now[:alert] = "Registration failed"
        redirect_to register_path
      end
    end
  
    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
