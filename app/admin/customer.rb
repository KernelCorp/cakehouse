ActiveAdmin.register Customer do
  show do
    attributes_table do
      row :name
      row :email
      row :phone
      row :delivery
      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column
    column :name do |customer|
      link_to customer.name, admin_customer_path(customer)
    end
    column :email
    column :phone
    column :delivery
    column :created_at
    column :updated_at
    default_actions
  end

end
