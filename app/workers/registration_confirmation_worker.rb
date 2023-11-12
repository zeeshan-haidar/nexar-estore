module Workers
  class RegistrationConfirmationWorker
    include Sidekiq::Worker
    sidekiq_options queue: :mailer, retry: 2, backtrace: true
    def self.perform(user_id)
      # Setup code
      begin
        UserMailer.registration_confirmation(user_id).deliver_later
      rescue StandardError => e
        # Error handling code
      end
    end
  end
end