module Artk
class Accession < Artk::Base
  
  def self.table_name
    "Accessions"
  end

  def self.primary_key
    "accessionId"
  end

end
end