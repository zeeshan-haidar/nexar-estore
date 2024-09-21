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
    cart_data = payment.order_details
    if current_user.id != payment.user_id
     redirect_to root_path , alert: 'You are not authorized to view this order'
    end
    products = cart_products(cart_data)
    products_array = []
    products.each do |product|
      products_hash = {
        product: product,
        quantity: cart_data[product.id.to_s].to_i
      }
      products_array << products_hash
    end
    @order_details = {
      invoice_date: payment.created_at.to_date,
      amount: payment.price.to_f,
      products_data: products_array,
      invoice_id: payment.id,
      user_first_name: payment.user.first_name,
      shipping_address: payment.shipping_address
    }
  end

  def my_orders
    @my_orders =  Payment.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(10) # 10 products per page
  end

  def form_params
    params.require(:payments).permit(
      :stripe_payment_id,
      :price
    )
  end
end
