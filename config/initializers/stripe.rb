# config/initializers/stripe.rb
Rails.configuration.stripe = {
  publishable_key: ENV.fetch('STRIPE_PUBLISHABLE_KEY', nil),
  secret_key: ENV.fetch('STRIPE_SECRET_KEY', nil),
  webhook_secret: ENV.fetch('STRIPE_WEBHOOK_SECRET', nil)
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
