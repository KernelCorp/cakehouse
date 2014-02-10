class CreateTableSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :name
      t.attachment :photo
      t.text :description
      t.timestamps
    end
  end

end
