class RegistrationConfirmationWorker
  include Sidekiq::Worker
  sidekiq_options queue: :mailer, retry: 2, backtrace: true
  def self.perform(user_id)
    # Setup code

    UserMailer.registration_confirmation(user_id).deliver_later
  rescue StandardError => e
    Rails.logger.info e
  end
end
