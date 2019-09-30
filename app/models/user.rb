# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  confirm_token          :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  email_confirmed        :boolean
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  primary_network_id     :integer
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  after_initialize :set_defaults


  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :primary_network_id, presence: :true

  belongs_to :primary_network, :class_name => 'Network', :foreign_key => :primary_network_id
  has_many :network_users, :dependent => :delete_all
  has_many :networks, through: :network_users

  after_update do
    email_confirmed?
  end

  def set_defaults
    self.email_confirmed ||= false
  end

  protected
  def password_required?
    confirmed? ? super : false
  end

  def email_confirmed?
    if self.password.blank?
      self.email_confirmed=true
    end
  end
end
