require 'spec_helper'

describe Sub do

  describe "associations" do
    it { should belong_to(:moderator) }
    it { should have_many(:links) }
  end

end
