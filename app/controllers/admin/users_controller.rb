class Admin::UsersController < ApplicationController
    before_action :authenticate_esteban!
  
    def new
      @user = Tuser.new
    end
  
    def create
      @user = Tuser.new(user_params)
      if @user.save
        redirect_to admin_users_path, notice: "Usuario creado exitosamente."
      else
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:tuser).permit(Tuser.admin_creation_params)
    end
  end