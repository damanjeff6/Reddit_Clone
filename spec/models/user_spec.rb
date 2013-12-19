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
end
