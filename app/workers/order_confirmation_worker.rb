class OrderConfirmationWorker
  include Sidekiq::Worker
  sidekiq_options queue: :mailer, retry: 2, backtrace: true
  def self.perform(user_id, payment_id)
    # Setup code

    UserMailer.order_confirmation(user_id, payment_id).deliver_later
  rescue StandardError => e
    Rails.logger.info e
  end
end
