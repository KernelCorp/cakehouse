class AddDeliveryToTableCustomer < ActiveRecord::Migration
  def change
    change_table :customers do |t|
      t.boolean :delivery
    end
  end
end
