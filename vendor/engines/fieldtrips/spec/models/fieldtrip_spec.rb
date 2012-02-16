require 'spec_helper'

describe Fieldtrip do

  def reset_fieldtrip(options = {})
    @valid_attributes = {
      :id => 1,
      :Name => "RSpec is great for testing too"
    }

    @fieldtrip.destroy! if @fieldtrip
    @fieldtrip = Fieldtrip.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_fieldtrip
  end

  context "validations" do
    
    it "rejects empty Name" do
      Fieldtrip.new(@valid_attributes.merge(:Name => "")).should_not be_valid
    end

    it "rejects non unique Name" do
      # as one gets created before each spec by reset_fieldtrip
      Fieldtrip.new(@valid_attributes).should_not be_valid
    end
    
  end

end