require 'spec_helper'

describe Bin do
  describe "associations" do
    it { should have_many(:links) }
  end

end
