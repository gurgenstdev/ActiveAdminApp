ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :password, :password_confirmation, :email_confirmed, :primary_network_id, network_ids: [],
                network_attributes: [:id, :name]
  csv_importable :columns => [:first_name, :last_name, :email], :import_unique_key => :email

  action_item :activate, only: [:show] do
    link_to "Resend Confirmation Email", new_user_confirmation_path unless user.email_confirmed
  end

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column "Active", :email_confirmed
    column :primary_network
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
      row :primary_network
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
      input :primary_network_id, :as => :select, collection: Network.all.map{|nt| [nt.name, nt.id]}
      f.input :networks, :as => :check_boxes, collection: Network.all.map{|u| [u.name, u.id]}
    end
    actions
  end

  filter :id, as: :numeric, label: "User ID"
  filter :email
  filter :first_name
  filter :last_name
  filter :networks, collection: Network.all.map{|u| [u.name]}
end