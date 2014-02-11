ActiveAdmin.register Page do
  index do
    selectable_column
    column :title do |page|
      link_to page.title, admin_page_path(page)
    end
    column :body do |page|
      raw truncate(page.body, :length => 40)
    end
    default_actions
  end

  show do |page|
    attributes_table do
      row :title
      row :body do
        raw page.body
      end
      row :slug
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
    end
    f.actions
  end

end
