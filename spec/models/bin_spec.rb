require 'spec_helper'

describe Bin do
  describe "associations" do
    it { should have_many(:links) }
  end

  describe "validation" do
    before { subject.stub(:generate_hash) }
    it { should validate_presence_of :secret_hash }
    it { should validate_presence_of :public_hash }
    it { should validate_presence_of :title }
    it { should_not allow_mass_assignment_of :secret_hash }
  end

  describe "defaults" do
    it "is public" do
      subject.should be_allow_public
    end
  end

  describe "#callbacks" do
    context "before validation" do
      context "on create" do
        let(:bin) { Bin.new }
        context "with a secret_hash" do
          before { bin.secret_hash = "Shhh" }
          it "does not generate a secret_hash" do
            bin.should_not_receive(:generate_hash)
            bin.run_callbacks(:validation)
          end
        end
        context "without a secret_hash" do
          it "generates a secret_hash" do
            bin.should_receive(:generate_hash)
            bin.run_callbacks(:validation)
          end
        end
        context "without a title" do
          it "generates a title" do
            bin.should_receive(:generate_title)
            bin.run_callbacks(:validation)
          end
        end
      end
    end
  end

  describe "#public_status" do
    subject { Fabricate(:bin) }
    before { subject.stub!(:allow_public?).and_return(is_public) }
    context "when public" do
      let(:is_public) { true }
      its(:public_status) { should == 'public' }
    end
    context "when private" do
      let(:is_public) { false }
      its(:public_status) { should == 'private' }
    end
  end
end
