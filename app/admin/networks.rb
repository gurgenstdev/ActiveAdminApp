ActiveAdmin.register Network do
  permit_params :name, user_ids: []
  csv_importable :columns => [:name], :import_unique_key => :name

  index do
    selectable_column
    id_column
    column :name
    column :users do |network|
      table_for network.users.order('email ASC') do
        column do |user|
          user
       end
      end
    end
    actions
  end

  show do
    attributes_table do
      row :name
      table_for network.users.order('email ASC') do
        column "Users" do |user|
          link_to user.email, [:admin, user]
        end
      end
    end
  end

  form title: "Adding New Networks" do |f|
    inputs "Network Details " do
      input :name
      f.input :users, :as => :check_boxes
    end
    actions
  end
end
