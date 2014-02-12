class AddTypeToTableImages < ActiveRecord::Migration
  def change
    change_table :images do |t|
      t.string :type
    end
  end
end
