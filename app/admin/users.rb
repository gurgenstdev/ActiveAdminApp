ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name
  csv_importable :columns => [:first_name, :last_name, :email], :import_unique_key => :email

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    actions
  end

  form title: 'A custom title' do |f|
    inputs 'User Details' do
      input :email
      input :first_name
      input :last_name
    end
    actions
  end
end
