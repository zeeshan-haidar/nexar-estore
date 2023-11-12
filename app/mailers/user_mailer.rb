class UserMailer < ApplicationMailer

  def registration_confirmation(user_id)
    @user = User.find(user_id)

    puts mail(   :to      => @user.email,
            :subject => "Welcome"
    ) do |format|
      format.text
      format.html
    end
  end
end
