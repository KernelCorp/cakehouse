class AddDescToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :desc, :string
  end
end
