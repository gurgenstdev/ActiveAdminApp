class RemovePrimaryNetworkFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :primary_network
  end
end
