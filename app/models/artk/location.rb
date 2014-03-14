module Artk
class Location < Artk::Base

  has_many :instances, :foreign_key => "locationId"

  def self.table_name
    "LocationsTable"
  end

  def self.primary_key
    "locationId"
  end

end
end
