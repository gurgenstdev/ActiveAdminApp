class AddPrimaryNetworkColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :primary_network, :string
  end
end
