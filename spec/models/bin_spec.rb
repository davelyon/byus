require 'spec_helper'

describe Bin do
  describe "associations" do
    it { should have_many(:links) }
  end

  describe "validation" do
    before { subject.stub(:generate_hash) }
    it { should validate_presence_of :secret_hash }
    it { should validate_presence_of :title }
    it { should_not allow_mass_assignment_of :secret_hash }
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
      end
    end
  end
end
