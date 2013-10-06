module Artk
class ResourceComponent < ActiveRecord::Base

  def self.table_name
    "ResourcesComponents"
  end

  def self.primary_key
    "resourceComponentId"
  end

end
end