require 'spec_helper'

describe Link do
  let(:bin) { Fabricate(:bin) }

  describe "association" do
    it { should belong_to(:bin) }
  end

  describe "validation" do
    before { subject.stub(:attach_bin) }
    it { should validate_presence_of(:bin) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:title) }
  end

  describe "location" do
    subject { Fabricate.build(:link, bin: bin) }
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
    let(:bin2) { Fabricate(:bin) }
    let(:link) { Fabricate.attributes_for(:link) }
    context "created with a bin" do
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
    context "created without title" do
      subject { bin.links.build( link[:title] = "" ) }
      it "assigns the location as the title" do
        subject.title.should == subject.location
      end
    end
    context "created with title" do
      subject { bin.links.build( link ) }
      it "uses the location" do
        subject.title.should == link[:title]
      end
    end
  end

  describe "#secret_hash" do
    subject { Fabricate(:link, bin: bin) }
    it "returns the bin hash" do
      subject.secret_hash.should == subject.bin.secret_hash
    end
  end

  describe "#normalized_url" do
    subject { Link.normalize_url(url) }
    context "with valid url" do
      let(:url) { "http://foobear.com/" }
      it { should == url }
    end
    context "without trailing slash" do
      let(:url) { "http://foobear.com" }
      it { should == url << "/" }
    end
    context "with and invalid url" do
      let(:url) { "return invalid" }
      it "returns invalid urls" do
        should == url
      end
    end
    context "with a blank url" do
      let(:url) { "" }
      it "returns nil" do
        should == nil
      end
    end
  end

  describe "#viewing_range" do
    subject { Link.viewing_range(time) }
    context "when time one of 24,48,168" do
      let(:time) { "48" }
      it "returns that time" do
        subject.should == time
      end
    end
    context "when time not one of 24,48,168" do
      let(:time) { "1000" }
      it "returns 24 as a default" do
        subject.should == "24"
      end
    end
  end

  describe "#display_title" do
    subject { bin.links.create!( attrs ) }
    context "no title" do
      let(:attrs) { { location: "http://google.com/"} }
      it "returns the location" do
        subject.display_title.should == subject.location
      end
    end
    context "with title" do
      let(:attrs) { Fabricate.attributes_for(:titled_link) }
      it "returns the title" do
        subject.display_title.should == subject.title
      end
    end
  end

end
