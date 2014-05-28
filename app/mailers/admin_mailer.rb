#encoding: utf-8
class AdminMailer < ActionMailer::Base
  default from: "like@cakehouse.me"
  default to: "like@cakehouse.me"

  def cake_order(customer)
    @customer = customer
    mail subject: 'Новый заказ на торт'
  end

  def sale_order(customer, order)
    @customer = customer
    @order = order
    mail subject: 'Новый заказ на акцию'
  end

end
