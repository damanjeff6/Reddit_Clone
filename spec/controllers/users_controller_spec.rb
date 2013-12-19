require 'spec_helper'

describe UsersController do
  describe "#create" do
    it "creates a new user" do
      FactoryGirl.create(:user).should be_valid
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

end
