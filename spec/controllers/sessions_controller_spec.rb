require 'spec_helper'

describe SessionsController do

  describe "#new" do
    it "should render a login page"

    end
  end

  describe "#create" do
    context "sign in failure" do
      it "should rerender login page on failure"
      end

      it "form should not be populated on failure"
      end
    end
  end

  describe "#destroy" do
    it "should log the user out"
    end

    it "should return user to login page on successful signout"
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

end
