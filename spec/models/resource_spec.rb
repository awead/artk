require 'spec_helper'

describe Artk::Resource do

  it "is the Resources table in the Archivist's Toolkit database" do
    Artk::Resource.table_name.should == "Resources"
  end

  it "has resourceId as the primary key" do
    Artk::Resource.primary_key.should == "resourceId"
  end

  describe "retrieving results" do

    it "can be all the recods in the table" do
      Artk::Resource.find(:all).count.should > 0
    end

    it "can be done using the ead id" do
      Artk::Resource.find_by_ead_id("ARC-0001").findingAidTitle.should == "Art Collins Papers"
    end

    it "returns nil of the ead id doesn't exist" do
      Artk::Resource.find_by_ead_id("asdf").should be_nil
    end

    it "returns a hash of the unique identifier and the unformatted title" do
       Artk::Resource.find_by_ead_id("ARC-0001").pid_and_title.should == {:pid => "ARC-0001", :title => "Art Collins Papers"}
    end
  end

  describe "::finding_aids" do
    it "are all the finding aids in AT" do
      fa_titles = Artk::Resource.finding_aids.collect { |fa| fa.title }
      fa_titles.should include "Jeff Gold Collection"
    end
  end

  describe "#components" do
    it "are the first level of <c> nodes in a finding aid" do
      titles = Artk::Resource.find_by_ead_id("ARC-0001").components.collect{ |c| c.title }
      titles.should include "Series I: Iggy Pop [RESTRICTED]"
      titles.should include "Series II: Marianne Faithfull [RESTRICTED]"
      titles.should include "Series III: Art Collins Personal [RESTRICTED]"
      titles.should include "Series IV: Audiovisual Materials [RESTRICTED]"
    end
  end

  describe "#all_series" do

    it "returns all components in the collection" do
      titles = Artk::Resource.find("45").all_series.collect { |c| c.title }
      titles.should include "Series VI: 16 Magazine Files"
      titles.should include "Subseries 2: Video [RESTRICTED]"
      titles.should include "Beatles"
      titles.should include "General"
      titles.should include "Subseries 2: Pop, Iggy"
      titles.should include "Brochure for Jimi Hendrix Experience"
    end

  end

  describe "#component" do
    it "should return a single component" do
      Artk::Resource.find_by_ead_id("ARC-0001").component("ref1").title.should == "Series I: Iggy Pop [RESTRICTED]"
    end
    it "should return nil" do
      Artk::Resource.find_by_ead_id("ARC-0001").component("blerg").should be_nil
    end

  end

end
