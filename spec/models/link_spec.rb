require 'spec_helper'

describe Link do
  describe "association" do
    it { should belong_to(:bin) }
  end

  describe "validation" do
    it { should validate_presence_of(:location) }
  end

  describe "creation" do
    context "when created without bin" do
      subject { Fabricate(:link) }
      its(:bin) { should_not be_nil }
      it "should set the bin title to link location" do
        subject.reload
        subject.bin.title.should == subject.location
      end
    end
  end

  describe "#attach_bin" do
    context "when creating a link without a bin" do
      subject { Fabricate.build(:link) }
      its(:bin) { should_not be_nil }
    end
  end

end
