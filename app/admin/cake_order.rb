ActiveAdmin.register CakeOrder do
  show do |order|
    attributes_table do
      row :customer
      row :stuff
      row :photo do
        image_tag order.photo.url
      end
      row :created_at
    end
  end

  index do
    selectable_column
    column :id do |order|
      link_to order.id, admin_cake_order_path(order)
    end
    column :customer
    column :stuff
    column :photo do |order|
      image_tag order.photo.url(:thumb)
    end
    column :created_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :customer, as: :select
      f.input :stuff
      f.input :photo, as: :file
    end
    f.actions
  end

end
