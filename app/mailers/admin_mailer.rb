#encoding: utf-8
class AdminMailer < ActionMailer::Base
  default from: "like@cakehouse.me"
  default to: "like@cakehouse.me"

  def cake_order(customer, order)
    @customer = customer
    @order = order
    mail subject: 'Новый заказ на торт'
  end

  def sale_order(customer, order)
    @customer = customer
    @order = order
    mail subject: 'Новый заказ на акцию'
  end

  def sales_delivery(slice)
    @sale = Sale.all.last
    mail subject: 'Новая акция на cakehouse.ru',
         bcc: slice
  end
end
