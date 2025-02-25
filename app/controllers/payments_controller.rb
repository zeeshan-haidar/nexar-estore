class PaymentsController < ApplicationController
  include Cart
  before_action :authenticate_user!
  def create
    cart_data = cart
    payment = Payment.new(form_params.merge({ user_id: current_user.id, order_details: cart_data, shipping_address: current_user.full_address }))
    if payment.save
      delete_cart
      redirect_to payment_order_details_path(payment_id: payment.id)
    else
      flash.now[:error] = "Oops, something went wrong with your submission. Please try again!"
      render :new
    end
  end

  def order_details
    payment = Payment.find(params[:payment_id])
    redirect_to root_path, alert: 'You are not authorized to view this order' if current_user.id != payment.user_id

    OrderConfirmationWorker.perform(current_user.id, payment.id)

    @order_details = order_detail(payment)
  end

  def my_orders
    @my_orders = Payment.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(10) # 10 products per page
  end

  def form_params
    params.require(:payments).permit(
      :stripe_payment_id,
      :price
    )
  end
end
