class RegistrationsController < Devise::RegistrationsController
    protected
  
    def after_sign_up_path_for(resource)
        # Redirect user to choose a role after signing up 
        choose_role_path(resource)
    end
end