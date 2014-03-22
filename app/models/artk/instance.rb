module Artk
class Instance < Artk::Base

  belongs_to :component, :foreign_key => "resourceComponentId"
  belongs_to :location, :foreign_key => "locationId"

  def self.table_name
    "ArchDescriptionInstances"
  end

  def self.primary_key
    "archDescriptionInstancesId"
  end

end
end
