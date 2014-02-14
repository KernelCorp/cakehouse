ActiveAdmin.register Feedback do
  show do |feedback|
    attributes_table do
      row :name
      row :photo do
        image_tag feedback.photo.url
      end
      row :desc
      row :text do |feedback|
        raw feedback.text
      end
      row :created_at
    end
  end

  index do
    selectable_column
    column :name do |feedback|
      link_to feedback.name, admin_feedback_path(feedback)
    end
    column :photo do |feedback|
      image_tag feedback.photo.url(:thumb)
    end
    column :created_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :desc
      f.input :text
      f.input :photo, as: :file
    end
    f.actions
  end
end
