require 'spec_helper'

describe Link do
  describe "associations" do
    it { should have_many(:comments) }
    it { should belong_to(:sub) }
    it { should belong_to(:submitter) }
  end
end
