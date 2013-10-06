require 'spec_helper'

describe Artk::Resource do

  before :each do
    @r = Artk::Resource.find(:all).first
  end

  it "should have a resouceId" do
    @r.respond_to?(:resourceId).should be_true
  end

end
