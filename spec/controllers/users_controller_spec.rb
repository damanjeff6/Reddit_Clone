require 'spec_helper'

describe UsersController do

  describe "#new" do
    it "should render new user page"
  end

  describe "#create" do
    it "creates a new user with valid username and password" do
      FactoryGirl.create(:user).should be_valid
    end
    it "does not create user with bad info" do
      FactoryGirl.create(:user, :username => '').should raise_error
    end
    it "logs in a user on sign up"
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

end
