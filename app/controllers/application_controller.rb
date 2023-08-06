class ApplicationController < ActionController::Base


    private

    def authorize_admin
      unless current_tuser&.admin?
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to root_path
      end
    end

end
