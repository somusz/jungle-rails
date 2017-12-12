class UserMailer < ApplicationMailer
  #user mailer application with the default from email address
  default from: "no-reply@jungle.com"

  #mailing order receipt
  def order_receipt(order)
    mail(to: order.email, subject: "Jungle Order ##{@order.id}: Thank you for your order!")
  end
end
