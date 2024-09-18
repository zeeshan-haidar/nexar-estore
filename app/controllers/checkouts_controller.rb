class CheckoutsController < ApplicationController
  def check
    if !user_signed_in?
      render json: { message: "sign_in" }, status: :ok
    elsif !current_user.shipping_address?
      render json: { message: "shipping_address" }, status: :ok
    else
      render json: { message: "ok" }, status: :ok
    end
  end
end
