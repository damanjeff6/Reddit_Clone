require 'spec_helper'

describe User do
  it { should allow_mass_assignment_of(:username) }
  it { should allow_mass_assignment_of(:password) }
  it { should_not allow_mass_assignment_of(:session_token) }
  it { should_not allow_mass_assignment_of(:password_digest) }

  describe "password" do
    it { should ensure_length_of(:password).is_at_least(6) }
    it "is a secure password" do
      :password.should_not eq(:password_digest)
    end
  end

  describe "find user by credentials" do
    it "should be able to find a user using a username and password"
      expect(FactoryGirl.create(:user, :username => "user",
                                       :password => "password"))
                        .to eq(User.find_by_credentials("user","password"))
    end
  end
end
