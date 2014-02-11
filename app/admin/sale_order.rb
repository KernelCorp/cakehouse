ActiveAdmin.register SaleOrder do



  show do
    attributes_table do
      row :customer
      row :sale
    end
  end

  index do
    selectable_column
    column :customer
    column :sale
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :customer, as: :select
      f.input :sale, as: :select
    end
    f.actions
  end

end
