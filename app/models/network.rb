# == Schema Information
#
# Table name: networks
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Network < ApplicationRecord
  validates :name, presence: true


  has_many :primary_users, :class_name => "User", :foreign_key => :primary_network_id
  has_many :network_users, dependent: :delete_all
  has_many :users, through: :network_users
end
