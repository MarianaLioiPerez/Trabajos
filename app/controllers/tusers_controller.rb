class TusersController < ApplicationController
  before_action :set_tuser, only: [:show, :edit, :update]
  before_action :authenticate_tuser!
  before_action :authorize_admin, only: [:new, :create]
  #load_and_authorize_resource


    def new

        @tuser = Tuser.new
    end


    def create
        @tuser = Tuser.new(tuser_params)

        if @tuser.save
          flash[:notice] = "Usuario creado exitosamente."
          #redirect_to @tuser
          redirect_to root_path, notice: 'Usuario registrado exitosamente.'
        else
          flash.now[:alert] = "Hubo un error al crear el usuario."
          render :new
        end
    end

    def show
      @aplications = @tuser.applications
      @tuser = Tuser.find(params[:id])
    end

    def index
      @tusers = Tuser.where.not(:id => current_tuser.id)
    end

    def edit
    end

    def update
        if @tuser.update(tuser_params)
          flash[:notice] = "Perfil actualizado exitosamente."
          redirect_to @tuser
        else
          flash[:alert] = "Hubo un error al actualizar el perfil."
          render :edit
        end
    end


      private

      def tuser_params
        params.require(:tuser).permit(:nombre, :experiencia, :educacion, :habilidades, :photo, :other_fields, :email, :password, :password_confirmation)
      end

      def authorize_admin
        unless current_tuser && current_tuser.admin?
          flash[:alert] = "Acceso denegado. Solo los administradores pueden crear usuarios nuevos."
          redirect_to root_path
        end
      end

      def set_tuser
        @tuser = Tuser.find(params[:id])
      end

end