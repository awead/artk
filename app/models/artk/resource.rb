module Artk
class Resource < ActiveRecord::Base

  def self.table_name
    "Resources"
  end

  def self.primary_key
    "resourceId"
  end

end
end