# app/controllers/users/registrations_controller.rb
module Users
  # overriding devise registrations controller
  class RegistrationsController < Devise::RegistrationsController
    # rubocop:disable Rails/LexicallyScopedActionFilter
    before_action :configure_permitted_parameters, only: [:create, :update]
    # rubocop:enable Rails/LexicallyScopedActionFilter
    def create
      # code before calling devise create method
      super # this will call devise registration controller's create method

      # send registration confirmation email
      RegistrationConfirmationWorker.perform(current_user.id) if current_user.present?
    end

    protected

    def update_resource(resource, params)
      return super if params["password"].present? # incase password present then it will run devise update method

      resource.update_without_password(params.except("current_password")) # to update user profile without password since devise update require password
    end

    def configure_permitted_parameters
      attributes = [:first_name, :last_name, :mobile, :street, :city, :country, :gender, :password]
      devise_parameter_sanitizer.permit(:sign_up, keys: attributes << [:email])
      devise_parameter_sanitizer.permit(:account_update, keys: attributes << [:password_confirmation])
    end
  end
end
