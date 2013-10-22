require "spec_helper"

describe Artk::ResourcesController do

  before :each do
    @routes = Artk::Engine.routes
  end

  describe "#index" do
    it "should return a list of collections" do
      get :index
      response.should be_success
    end
    it "should search for collection titles" do
      get :index, {:q => "Terry"}
      response.should be_success
    end
  end

  describe "#show" do
    it "should return a single resource" do
      get :show, :id => "ARC-0001"
      response.should be_success
    end

    it "should return 404" do
      get :show, :id => "asdf"
      response.code.should == "404"
    end
  end

end