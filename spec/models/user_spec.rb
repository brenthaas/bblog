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

require 'spec_helper'

describe User do
	before do
	  @user = User.create( name: 'Test User',
	  										username: 'testuser',
	  										password: 'foobar', password_confirmation: 'foobar' )
	end
	subject { @user }

	it { should be_valid }
	it { should respond_to(:name) }
	it { should respond_to(:username) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:authenticate) }
	it { should respond_to(:token) }

	describe "token creation" do
		before { @user.save }

		its(:token) {should_not be_empty}
	end

	context "passwords are required" do
		it 'should not accept a password of ""' do
			@user.password = @user.password_confirmation = ""
			should_not be_valid
		end
		it "should not accept a nil password" do
			@user.password = @user.password_confirmation = nil
		end
	end

	specify "passwords must match" do
		@user.password_confirmation = "different"
		should_not be_valid
	end

	describe "user authentication" do
		before { @user.save }
		let(:found_user) { User.find_by_username(@user.username) }
		
		it "should authenticate with a matching password" do
			@user.should == found_user.authenticate(@user.password)
		end

		context "with wrong password given" do
			let(:with_invalid_pass) { found_user.authenticate("wrongPass") }
			it "should not return the user" do
				@user.should_not == with_invalid_pass
			end
			it "should return false as a failure" do
				with_invalid_pass.should == false
			end
		end
	end

	describe "field validation" do
		specify "name must be given" do
			@user.name = ""
			should_not be_valid
		end
		specify "username must be given" do
			@user.username = ""
			should_not be_valid
		end
		specify "passwords must be 6 characters long" do
			@user.password = @user.password_confirmation = "12345"
		end
		describe "duplication" do
			before do 
				@user.save!
				@newuser = FactoryGirl.create(:user)
			end
			it "unique fields are fine" do
				@newuser.should be_valid
			end
			it "duplicate usernames cannot be used" do
				@newuser.username = @user.username
				@newuser.should_not be_valid
			end
		end

		describe "blog entries" do
			context "created out of order" do
				# first created current post
				let!(:new_post) do
					FactoryGirl.create(:blog, user: @user,
						posting_date: 2.days.ago, created_at: 2.days.ago ) 
				end 
				# newer creation, but old post
				let!(:old_post) do
					FactoryGirl.create(:blog, user: @user,
						posting_date: 1.week.ago, created_at: Date.yesterday)
				end
				# created now - should be first
				let!(:newest_post) do
					FactoryGirl.create(:blog, user: @user,
						posting_date: Time.now, created_at: Time.now)
				end

				it "will list newest first by posting_date" do
					@user.blogs.should == [newest_post, new_post, old_post]
				end
			end
		end
	end
end
