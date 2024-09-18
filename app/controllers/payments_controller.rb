class PaymentsController < ApplicationController
  def create
    @payment = Payment.new(form_params.merge({ user_id: current_user.id }))
    if @payment.save
      redirect_to cart_show_url
    else
      flash.now[:error] = "Oops, something went wrong with your submission. Please try again!"
      render :new
    end
  end

  def form_params
    params.require(:payments).permit(
      :stripe_payment_id,
      :price
    )
  end
end
