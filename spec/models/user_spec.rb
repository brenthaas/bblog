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

require 'spec_helper'

describe User do
	before do
	  @user = User.new(name: "Brent Haas", username: "brent",
	  								password: "foobar", password_confirmation: "foobar")
	end
	subject { @user }

	it { should be_valid }
	it { should respond_to(:name) }
	it { should respond_to(:username) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:password_digest) }

	describe "passwords are required" do
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
			@newuser = User.new(name: "CopyCat", username: "copy", 
											password: "blahblah", password_confirmation: "blahblah")
		end
		it "unique fields are fine" do
			@newuser.should be_valid
		end
		it "duplicate usernames cannot be used" do
			@newuser.username = "brent"
			@newuser.should_not be_valid
		end
	end
end
