require 'spec_helper'

describe Bin do
  describe "associations" do
    it { should have_many(:links) }
  end

  describe "validation" do
    it { should validate_presence_of :title }
  end

  describe "creation" do
    context "when created from a new link" do
      subject { Fabricate(:link).bin }
      its(:title) { should_not be_nil }
    end
  end

end
