class CakeOrdersController < ApplicationController
  #before_filter :parse_raw_file, only: [:create]
  def create
    customer = Customer.find_or_initialize_by_email email: params[:cake_order][:customer][:email]
    if !customer.valid?
      head :unprocessable_entity
      return
    end
    customer.update_attributes params[:cake_order][:customer]
    customer.save!
    cake_order = CakeOrder.new stuff: params[:cake_order][:stuff], photo: params[:cake_order][:photo]
    if !cake_order.valid?
      head :unprocessable_entity
      return
    end
    cake_order.save!
    customer.cake_orders.push cake_order
    @mail = AdminMailer.cake_order(customer, cake_order).deliver
    head :ok
  end

  private
  def parse_raw_file
    if params[:cake_order][:photo]
      @raw_file = env['rack.input']
      @raw_file.class.class_eval { attr_accessor :original_filename, :content_type}
      @raw_file.original_filename = params[:cake_order][:photo][:original_filename]
      @raw_file.content_type = params[:cake_order][:photo][:content_type]
    end
  end
end