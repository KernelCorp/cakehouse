class CakeOrdersController < ApplicationController
  def create
    customer = Customer.find_or_initialize_by_email email: params[:order][:customer][:email]
    if !customer.valid?
      head :unprocessable_entity
      return
    end
    customer.update_attributes params[:order][:customer]
    customer.save!
    cake_order = CakeOrder.create! stuff: params[:order][:stuff], photo: params[:order][:photo]
    customer.cake_orders.push cake_order
    @mail = AdminMailer.cake_order(customer, cake_order).deliver
    head :ok

    #@customer.update_attributes phone: params[:customer][:phone], name: params[:customer][:name]
    #head :ok
  end
end