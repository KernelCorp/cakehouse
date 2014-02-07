#encoding: utf-8
class AdminMailer < ActionMailer::Base
  default from: "admin@gmail.com"
  default to: "admin@gmail.com"

  def order(customer, order)
    @customer = customer
    @order = order
    mail subject: 'Новый заказ на торт'
  end
end
