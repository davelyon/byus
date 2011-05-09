require 'spec_helper'

describe Bin do
  describe "associations" do
    it { should have_many(:links) }
  end

  describe "validation" do
    it { should validate_presence_of :title }
    it { should_not allow_mass_assignment_of :secret_hash }
  end

end
