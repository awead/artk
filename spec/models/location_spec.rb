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

end
