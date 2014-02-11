class CreateTableSaleOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.references :sale
    end
  end
end
