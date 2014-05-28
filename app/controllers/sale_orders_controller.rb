class SaleOrdersController < ApplicationController
  def create
    customer = Customer.find_or_initialize_by_phone phone: params[:sale_order][:customer][:phone]
    customer.update_attributes params[:sale_order][:customer]
    if !customer.valid?
      head :unprocessable_entity
      return
    end
    if Sale.all.length == 0
      head :unprocessable_entity
      return
    end
    customer.save!
    @sale_order = SaleOrder.create!
    customer.sale_orders.push @sale_order
    Sale.all.last.sale_orders.push @sale_order
    @mail = AdminMailer.sale_order(customer, @sale_order).deliver
    head :ok
  end

end