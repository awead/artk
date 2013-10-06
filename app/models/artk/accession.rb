class Artk::Accession < ActiveRecord::Base
  
  def self.table_name
    "Accessions"
  end

  def self.primary_key
    "accessionId"
  end

end