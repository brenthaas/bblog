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
  let(:password) { 'foobar' }
  subject do
    User.create( name: 'Test User',
                 username: 'testuser',
                 password: password,
                 password_confirmation: password )
  end

  it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:username) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:token) }

  describe "passwords" do

    it "creates a token" do
      expect(subject.token).to be_present
    end

    context "passwords are required" do
      it "should not accept a nil password" do
        subject.password = subject.password_confirmation = nil
      end
    end

    specify "passwords must match" do
      subject.password_confirmation = "different"
      expect(subject).to_not be_valid
    end

    describe "user authentication" do
      let(:found_user) { User.find_by_username(subject.username) }

      it "should authenticate with a matching password" do
        expect(found_user.authenticate(password)).to eq subject
      end

      context "with wrong password given" do
        it "should not return the user" do
          expect(found_user.authenticate('wrong')).to eq false
        end
      end
    end
  end

  describe "field validation" do

    specify "name must be given" do
      expect(subject).to validate_presence_of(:name)
    end

    specify "username must be given" do
      expect(subject).to validate_presence_of(:username)
    end

    specify "username must be unique" do
      expect(subject).to validate_uniqueness_of(:username)
    end
  end
end
