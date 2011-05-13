require 'spec_helper'

describe Link do
  describe "association" do
    it { should belong_to(:bin) }
  end

  describe "validation" do
    before { subject.stub(:attach_bin) }
    it { should validate_presence_of(:bin) }
    it { should validate_presence_of(:location) }
  end

  describe "location" do
    subject { Fabricate.build(:link) }
    context "when valid" do
      let(:http) { "http://reddit.com/" }
      let(:https) { "https://facebook.com/"}
      let(:other) { "http://www3.google.com/a/b"}
      it "should allow http links" do
        subject.location = http
        subject.should be_valid
      end

      it "should allow https links" do
        subject.location = https
        subject.should be_valid
      end

      it "should allow other links" do
        subject.location = other
        subject.should be_valid
      end
    end
    context "when invalid" do
      let(:no_protocol) { "dave" }
      let(:slashes) { "//foo/bar"}
      let(:colons) { ":foo/:bar_/foo"}
      it "should not allow words" do
        subject.location = no_protocol
        subject.should_not be_valid
      end

      it "should not allow links with slashes but no protocol" do
        subject.location = slashes
        subject.should_not be_valid
      end

      it "should not allow links with colons and slashes but no protocol" do
        subject.location = colons
        subject.should_not be_valid
      end
    end
  end

  describe "creation" do
    context "when created without bin" do
      subject { Fabricate(:link) }
      it "should set the bin title to link location" do
        subject.bin.title.should == subject.location
      end
    end
    context "created with a bin" do
      let(:bin) { Fabricate(:bin) }
      let(:bin2) { Fabricate(:bin) }
      let(:link) { Fabricate.attributes_for(:link) }
      before { bin.links.create!(link) }
      context "when creating duplicate in same bin" do
        it "should not save duplicate link" do
          bin.links.new(link).should_not be_valid
        end
      end
      context "when creating duplicate in another bin" do
        it "should save duplicate link" do
          bin2.links.new(link).should be_valid
        end
      end
    end
  end

  describe "#attach_bin" do
    context "when creating a link without a bin" do
      subject { Fabricate.build(:link) }
      it "should create a bin and attach it" do
        subject.save
        subject.bin.should_not be_nil
      end
    end
    context "when creating a link from a bin" do
      let(:bin) { Fabricate(:bin) }
      subject { bin.links.new(location: "http://is.gd") }
      it "should not create a new bin" do
        subject.bin.should == bin
      end
    end
  end

  describe "#secret_hash" do
    subject { Fabricate(:link) }
    it "should return the bin hash" do
      subject.secret_hash.should == subject.bin.secret_hash
    end
  end

end
