class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt(order)
    @order = order
    mail(to: @order.email, subject: "Jungle Order ##{@order.id}: Thank you for your order!")
  end
end
