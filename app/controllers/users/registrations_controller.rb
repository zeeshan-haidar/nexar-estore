# app/controllers/users/registrations_controller.rb
module Users
  # overriding devise registrations controller
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, only: [:create]
    def create
      # code before calling devise create method
      super # this will call devise registration controller's create method

      # send registration confirmation email
      RegistrationConfirmationWorker.perform(current_user.id)
    end

    protected

    def configure_permitted_parameters
      attributes = [:first_name, :last_name, :email, :password, :mobile, :street, :city, :country]
      devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
      # devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end
  end
end
