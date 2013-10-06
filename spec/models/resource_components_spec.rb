require "spec_helper"

describe Artk::ResourceComponent do

  before :each do
    @c = Artk::ResourceComponent.find(:all).first
  end 

  it "should have a resourceComponentId" do
    @c.respond_to?(:resourceComponentId).should be_true
  end

end