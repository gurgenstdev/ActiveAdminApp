class AddPrimaryNetworkIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :primary_network_id, :integer
  end
end
