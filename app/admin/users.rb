ActiveAdmin.register User do
  # TODO
  # add network with many-to-many relationship with user +
  # add networks with form and csv
  # add primary network to user
  # fix user's emails part when adding users to the network

  permit_params :email, :first_name, :last_name, network_ids: []
  csv_importable :columns => [:first_name, :last_name, :email], :import_unique_key => :email


  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :networks do |user|
      table_for user.networks.order('name ASC') do
        column do |network|
          network
        end
      end
    end
    actions
  end

  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name
      table_for user.networks.order('name ASC') do
        column "Networks" do |network|
          link_to network.name, [:admin, network]
        end
      end
    end
  end

  form title: 'Adding New Users' do |f|
    inputs 'User Details' do
      input :email
      input :first_name
      input :last_name
      f.input :networks, :as => :check_boxes
    end
    actions
  end
end
