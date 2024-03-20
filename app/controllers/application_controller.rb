class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    # Redirect to root after signing in
    def after_sign_in_path_for(resource)
        #flash[:notice] = "Login successful"
        root_path
    end

    # Redirect to root after signing out
    def after_sign_out_path_for(resource)
        #flash[:alert] = "Logged out"
        root_path
    end

    protected
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :firstname, :lastname, :username, :occupation, :gender, :role, :uid, :provider])
        devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :firstname, :lastname, :username, :occupation, :gender, :role, :uid, :provider])
      end
end
