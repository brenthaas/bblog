require 'spec_helper'

describe Blog do

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:posting_date) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }

  describe "The date should be set to current by default" do
    let(:user) { FactoryGirl.create(:user) }
    let(:new_blog) { user.blogs.create(title: "Foobar") }

    it "should set the date to creation date" do
      expect(new_blog.posting_date).to eq Date.today
    end
  end
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


