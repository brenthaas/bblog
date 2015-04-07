class Note < ActiveRecord::Base
  attr_accessor :content, :title

  validates_presence_of :title, :content
end
