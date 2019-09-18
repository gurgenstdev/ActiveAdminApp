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

  has_many :network_users
  has_many :users, through: :network_users
end
