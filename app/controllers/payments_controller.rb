class PaymentsController < ApplicationController

  def checkout
    if !user_signed_in?
      render json: { message: "sign_in" }, status: 200
    elsif !current_user.shipping_address?
      render json: { message: "shipping_address" }, status: 200
    else
      render json: { message: "ok" }, status: 200
    end
  end
end
