class PaymentIntentsController < ApplicationController
  def create
    # Create a payment intent with the expected amount,
    payment_intent = Stripe::PaymentIntent.create(
      amount: (params[:amount].to_f*100).to_i,
      currency: 'usd',
      description: "Nexar Estore",
      )
    # return the client secret
    render json: {
      id: payment_intent.id,
      client_secret: payment_intent.client_secret
    }
  end
end