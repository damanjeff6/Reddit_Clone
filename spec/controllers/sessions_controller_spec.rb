require 'spec_helper'

describe SessionsController do

  describe "#new" do
    it "should render a login page"
  end

  describe "#create" do
    context "sign in failure" do
      it "should rerender login page on failure"

      it "form should not be populated on failure"
    end
  end

  describe "#destroy" do
    it "should log the user out"

    it "should return user to login page on successful signout"
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

end
