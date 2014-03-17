require 'spec_helper'

describe Artk::Location do

  it "is the LocationsTable table in the Archivist's Toolkit database" do
    Artk::Location.table_name.should == "LocationsTable"
  end

  it "has locationId as the primary key" do
    Artk::Location.primary_key.should == "locationId"
  end

  it "has many instances" do
    Artk::Location.find("1524").instances.count.should == 15
  end

  describe "coordinates" do
    
    before :all do
      @inst = Artk::Location.find("1524")
    end

    it "should return the first coordinate" do
      @inst.coordinate_value(1).should == "1"
      @inst.coordinate_label(1).should == "Range"
    end

    it "should return the second coordinate" do
      @inst.coordinate_value(2).should == "J"
      @inst.coordinate_label(2).should == "Section"
    end

    it "should return the third coordinate" do
      @inst.coordinate_value(3).should == "7"
      @inst.coordinate_label(3).should == "Shelf"
    end

  end

end
