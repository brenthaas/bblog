class Blog < ActiveRecord::Base
  attr_accessor :content, :location, :posting_date, :title
  belongs_to :user

  validates :user_id, presence: true

  before_save { self.posting_date ||= Time.now.to_date }

  default_scope -> { order('blogs.posting_date DESC') }
end
# == Schema Information
#
# Table name: blogs
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  title        :string(255)
#  posting_date :date
#  location     :string(255)
#  content      :text
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

