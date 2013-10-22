require "spec_helper"

describe Artk::Component do

  it "is the ResourcesComponents table in the Archivist's Toolkit database" do
    Artk::Component.table_name.should == "ResourcesComponents"
  end

  it "has resourceComponentId as the primary key" do
    Artk::Component.primary_key.should == "resourceComponentId"
  end

  describe "sub_components" do
    it "are defined as component objects linked to other component objects" do
      component = Artk::Component.find("18935")
      component.title.should == "Series VII: Audiovisual Materials [RESTRICTED]"
      sub_component_titles = component.sub_components.collect { |c| c.title }
      sub_component_titles.should include "Subseries 1: Audio [RESTRICTED]"
      sub_component_titles.should include "Subseries 2: Video [RESTRICTED]"
    end
  end

  describe "resource" do
    it "is the parent resource of a component" do
      Artk::Component.find("18935").resource.title.should == "Jeff Gold Collection"
    end
  end

  describe "#has_child?" do
    it "returns false when a component has no childern" do
      Artk::Component.find("14404").has_child?.should be_false
    end

    it "returns true with a component has child components linked to it" do
      Artk::Component.find("14402").has_child?.should be_true
    end
  end

  describe "#pid_and_title" do
    it "returns a hash of the unique id and unformatted title" do
      Artk::Component.find("18935").pid_and_title.should == { :pid => "ref1884", :title => "Series VII: Audiovisual Materials [RESTRICTED]" }
    end
  end

end