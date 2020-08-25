class UserMailer < ApplicationMailer
 
  def order_receipt(order)
    @order = order
    mail(to: @order.email, subject: "Order ID: ##{@order.id}")
  end
end
