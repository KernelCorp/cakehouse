class CreateTableOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :type
      t.string :stuff
      t.attachment :photo
      t.references :customer
    end
  end
end
