class CustomersController < ApplicationController

  def create
    @customer = Customer.new(params[:customer])
    @customer.save!
    @sale_order = SaleOrder.new(sale_id: Sale.last.id, customer_id: @customer.id)
    @sale_order.save!
    head :ok
  end

end