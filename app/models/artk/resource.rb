module Artk
class Resource < Artk::Base

  has_many :components, :foreign_key => "resourceId"

  def self.table_name
    "Resources"
  end

  def self.primary_key
    "resourceId"
  end

  def self.finding_aids
    self.where('eadFaUniqueIdentifier != "" and findingAidTitle !=""').order("findingAidTitle")
  end

  # TODO: sanitize params?
  def self.find_by_ead_id id
    self.where("eadFaUniqueIdentifier = '#{id}'").first
  end

  # Returns all Artk::Component objects or <c> nodes that are in the collection.
  # We have to build the component levels one by one, limited to 6 levels.
  def all_series
    first   = self.components
    second  = []
    third   = []
    fourth  = []
    fifth   = []
    sixth   = []
    
    # Get additional series, second through sixth
    second  = first.collect { |r| r.sub_components }.flatten unless first.empty?
    third   = second.collect { |r| r.sub_components }.flatten unless second.empty?
    fourth  = third.collect { |r| r.sub_components }.flatten unless third.empty?
    fifth   = fourth.collect { |r| r.sub_components }.flatten unless fourth.empty?
    sixth   = fifth.collect { |r| r.sub_components }.flatten unless fifth.empty?

    return (first + second + third + fourth + fifth + sixth).sort
  end

  # Returns a single Artk::Component for a given ref id
  def component ref
    self.all_series.collect { |c| c if c.persistentId == ref }.compact.first
  end

  def pid_and_title
    { :pid => self.eadFaUniqueIdentifier, :title => self.findingAidTitle }
  end

  private

  # not used because we're returning all components and not just those that have sub-components
  def retrieve_initial_series
    self.components.keep_if{ |c| c.has_child? }
  end

  # not used because we're returning all components and not just those that have sub-components
  def retrieve_additional_series component
    component.sub_components.keep_if{ |c| c.has_child? }
  end

end
end