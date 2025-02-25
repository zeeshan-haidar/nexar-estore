class UserMailer < ApplicationMailer
  include Cart
  include PagesHelper
  helper :pages
  def registration_confirmation(user_id)
    @user = User.find(user_id)

    mail(to: @user.email,
         subject: "Registration Confirmation - NEXAR",
         from: "no_reply@nexar.com") do |format|
      format.html
    end
  end

  def order_confirmation(user_id, payment_id)
    @user = User.find(user_id)
    payment = Payment.find(payment_id)
    @order_details = order_detail(payment)

    mail(to: @user.email,
         subject: "Order Confirmation - NEXAR",
         from: "no_reply@nexar.com") do |format|
      format.html
    end
  end
end
