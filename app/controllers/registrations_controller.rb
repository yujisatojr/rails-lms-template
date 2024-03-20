class RegistrationsController < Devise::RegistrationsController

  def create
    super
    resource.save
  end

    protected

    def after_inactive_sign_up_path_for(resource)
      inactive_sign_up_path
    end

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

  end