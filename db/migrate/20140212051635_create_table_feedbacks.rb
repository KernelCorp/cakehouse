class CreateTableFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.attachment :photo
      t.text :text
      t.timestamps
    end
  end
end
