class ApplicationController < ActionController::Base
  
 # load_and_authorize_resource

    private

    def authorize_admin
      unless current_tuser  && current_tuser.admin?
        flash[:alert] = "Acceso denegado."
        redirect_to root_path
      end
    end

end
