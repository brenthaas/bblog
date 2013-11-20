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
#  token           :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :username,
      :password_digest, :password, :password_confirmation,
      :token

  has_secure_password

  has_many :blogs, dependent: :destroy

  validates :name, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: true }
  validates :password, presence: true, length: { minimum: 6 }

  before_save { |user| user.username = username.downcase }
  before_save :create_user_token

  private
    def create_user_token
      self.token = SecureRandom.urlsafe_base64
    end
end
