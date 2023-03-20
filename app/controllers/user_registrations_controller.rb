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
        redirect_to register_path, notice: "Registration failed"
      end
    end
  
    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
