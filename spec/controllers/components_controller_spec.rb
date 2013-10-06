require "spec_helper"

describe Artk::ComponentsController do

  before :each do
    @routes = Artk::Engine.routes
  end

  describe "#index" do
    it "should return a set of componets for a given resource" do
      get :index, :resource_id => "ARC-0001"
      response.should be_success
    end
  end

end