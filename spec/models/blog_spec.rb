require 'spec_helper'

describe Blog do
	let(:blog)	{ FactoryGirl.create(:blog) }

	subject { blog }

	it { should respond_to(:title) }
	it { should respond_to(:content) }
	it { should respond_to(:posting_date) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }

	let(:user) { blog.user }

	it "should not allow access to user_id" do
		expect do
			Blog.new(user_id: user.id)
		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
	end

	describe "when the blog author is not present" do
		before { blog.user = nil }
		it { should_not be_valid }
	end

	describe "The date should be set to current by default" do
		before { user.save }
		let!(:older_post) { FactoryGirl.create(:blog, user: user, posting_date: nil, created_at: Time.now) }
		it "should set the date to creation date" do
			older_post.posting_date.should == Date.today
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


