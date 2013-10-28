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

  # Returns all Artk::Component objects that have children components attached to them
  # and are not just the first level of <c> nodes in the finding aid
  def all_series
    first   = retrieve_initial_series
    second  = []
    third   = []
    fourth  = []
    fifth   = []
    sixth   = []
    
    # Get additional series, second through sixth
    second  = first.collect { |r| retrieve_additional_series(r) }.flatten unless first.empty?
    third   = second.collect { |r| retrieve_additional_series(r) }.flatten unless second.empty?
    fourth  = third.collect { |r| retrieve_additional_series(r) }.flatten unless third.empty?
    fifth   = fourth.collect { |r| retrieve_additional_series(r) }.flatten unless fourth.empty?
    sixth   = fifth.collect { |r| retrieve_additional_series(r) }.flatten unless fifth.empty?

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

  def retrieve_initial_series
    self.components.keep_if{ |c| c.has_child? }
  end

  def retrieve_additional_series component
    component.sub_components.keep_if{ |c| c.has_child? }
  end

end
end