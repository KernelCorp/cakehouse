class CreateTableSaleOrders < ActiveRecord::Migration
  def change
    create_table :sale_orders do |t|
      t.references :sales
      t.timestamps
    end
  end
end
