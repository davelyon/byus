require 'spec_helper'

describe BinsHelper do
  describe "#class_for_time_selection" do
    context "when params[:time] is not empty" do
      let(:params) { {time: '168'} }
      it "returns 'current_view' for time == params[:time]" do
        class_for_time_selection('168').should == 'current_view'
      end
      it "returns '' for others" do
        class_for_time_selection('24').should == ''
      end
    end
    context "when params[:time] is empty" do
      let(:params) { {} }
      it "returns 'current_view' for '24'" do
        class_for_time_selection('24').should == 'current_view'
      end
      it "returns '' for anything else" do
        class_for_time_selection('25').should == ''
      end
    end
  end
end
