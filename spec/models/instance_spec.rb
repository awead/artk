require 'spec_helper'

describe Artk::Instance do

  it "is the ArchDescriptionInstances table in the Archivist's Toolkit database" do
    Artk::Instance.table_name.should == "ArchDescriptionInstances"
  end

  it "has resourceId as the primary key" do
    Artk::Instance.primary_key.should == "archDescriptionInstancesId"
  end

  it "belongs to an Artk::Component" do
    Artk::Instance.all.first.component.should be_kind_of Artk::Component
  end

end
