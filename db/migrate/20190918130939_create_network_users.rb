class CreateNetworkUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :network_users do |t|
      t.references :network, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
