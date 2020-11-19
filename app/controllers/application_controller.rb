class ApplicationController < ActionController::Base
    before_action :sign_up_parameters, if: :devise_controller?

    def sign_up_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :first_name, :last_name, :transporter_role, :livestock_owner_role)}
      
    #   devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :first_name, :last_name)}
    end

end
