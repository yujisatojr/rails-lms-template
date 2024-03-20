class ConfirmationsController < Devise::ConfirmationsController
    private
    def after_confirmation_path_for(resource_name, resource)
      # Comment out if you want to automatically log in the user
      sign_in(resource)
      account_confirmed_path
    end
end