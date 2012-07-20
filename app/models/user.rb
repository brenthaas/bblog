# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  username        :string(255)
#  password_digest :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :username, 
  		:password_digest, :password, :password_confirmation
  has_secure_password

  validates :name, presence: true 
  validates :username, presence: true, uniqueness: { case_sensitive: true }
  validates :password, length: { minimum: 6 }
end
