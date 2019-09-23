# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  primary_network :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :email, presence: :true, uniqueness: true
  #validates :primary_network_id, presence: :true

  #belongs_to :primary_network
  has_many :network_users, :dependent => :delete_all
  has_many :networks, through: :network_users
end
