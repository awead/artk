module Artk
class Component < Artk::Base

  belongs_to :resource, :foreign_key => "resourceId"
  has_many :sub_components, :class_name => "Component", :foreign_key => "parentResourceComponentId"

  def self.table_name
    "ResourcesComponents"
  end

  def self.primary_key
    "resourceComponentId"
  end

  def has_child?
    self.sub_components.count > 0 ? true : false
  end 

  def pid_and_title
    { :pid => self.persistentId, :title => self.title }
  end 

end
end