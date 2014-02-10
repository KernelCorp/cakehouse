class CakeOrdersController < ApplicationController
  def create
    customer = Customer.find_or_initialize_by_email email: params[:order][:customer][:email]
    if customer.valid?
      customer.update_attributes params[:order][:customer]
      customer.save!
      cake_order = CakeOrder.create! stuff: params[:order][:stuff], photo: params[:order][:photo]
      #customer.orders.push cake_order
      cake_order.customer = customer
      @mail = AdminMailer.order(customer, cake_order).deliver
      head :ok
    else
      head :unprocessable_entity
    end
    #@customer.update_attributes phone: params[:customer][:phone], name: params[:customer][:name]
    #head :ok
  end
end