class UsersController < ApplicationController
  before_action :authenticate_user!

  # since devise dose't provide the show method, so created custom method in our custom controller
  def show
    @user = User.find(params[:id])
  end
end
