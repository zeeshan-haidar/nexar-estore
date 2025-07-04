class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil
    endpoint_secret = Rails.configuration.stripe[:webhook_secret]

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )
    rescue JSON::ParserError
      # Invalid payload
      render json: { message: 'invalid json' }, status: :bad_request
      return
    rescue Stripe::SignatureVerificationError
      # Invalid signature
      render json: { message: 'signature verification failed' }, status: :bad_request
      return
    end

    # Handle the event
    case event.type
    when 'payment_intent.succeeded'
      payment_intent = event.data.object # contains a Stripe::PaymentIntent

      puts "PaymentIntent succeeded"
      @payment = Payment.find_by!(stripe_payment_id: payment_intent.id)
      @payment.update(status: 'paid')
      puts "Payment found: #{@payment.id}"

      # SubmissionMailer.receipt(@submission).deliver_later
      # SubmissionMailer.newsubmission(@submission).deliver_later
    else
      puts "Unhandled event type: #{event.type}"
    end

    render json: { message: 'success' }
  end
end
