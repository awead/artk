require "spec_helper"

describe Artk::Accession do

  it "is the Accession table in the AT database" do
    Artk::Accession.table_name.should == "Accessions"
  end

  it "has accessionId for the primary key" do
    Artk::Accession.primary_key.should == "accessionId"
  end

end
