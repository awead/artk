require "spec_helper"

describe Artk::AccessionsController do

  before :each do
    @routes = Artk::Engine.routes
  end

  describe "#index" do
    it "should return all the accessions" do
      get :index
      response.should be_success
    end

  end

end