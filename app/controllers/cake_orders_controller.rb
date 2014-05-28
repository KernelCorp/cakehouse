class CakeOrdersController < ApplicationController
  #before_filter :parse_raw_file, only: [:create]
  def create
    customer = Customer.find_or_initialize_by_phone phone: params[:cake_order][:customer][:phone]
    customer.update_attributes params[:cake_order][:customer]
    if !customer.valid?
      head :unprocessable_entity
      return
    end
    customer.save!
    @mail = AdminMailer.cake_order(customer).deliver
    head :ok
  end

end