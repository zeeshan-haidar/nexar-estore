class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # The rescue_from method in Rails is used to handle exceptions globally across all actions in all controllers that inherit from ApplicationController.
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end
end
