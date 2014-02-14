class CakeOrdersController < ApplicationController
  def create
    customer = Customer.find_or_initialize_by_email email: params[:cake_order][:customer][:email]
    if !customer.valid?
      head :unprocessable_entity
      return
    end
    customer.update_attributes params[:cake_order][:customer]
    customer.save!
    cake_order = CakeOrder.create! stuff: params[:cake_order][:stuff], photo: params[:cake_order][:photo]
    customer.cake_orders.push cake_order
    @mail = AdminMailer.cake_order(customer, cake_order).deliver
    head :ok
  end
end