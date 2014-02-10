ActiveAdmin.register Sale do
  show do |sale|
    attributes_table do
      row :name
      row :photo do
        image_tag sale.photo.url
      end
      row :description do |sale|
        raw sale.description
      end
      row :created_at
    end
  end

  index do
    selectable_column
    column :name do |sale|
      link_to sale.name, admin_sale_path(sale)
    end
    column :photo do |sale|
      image_tag sale.photo.url(:thumb)
    end
    column :created_at
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :photo, as: :file
    end
    f.actions
  end
end
