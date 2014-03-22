module Artk
class Location < Artk::Base

  has_many :instances, :foreign_key => "locationId"

  def self.table_name
    "LocationsTable"
  end

  def self.primary_key
    "locationId"
  end

  def coordinate_value i
    if self.alphanumeric_indicator(i).blank?
      formatted_numeric_indicator self.numeric_indicator(i)
    else
      [formatted_numeric_indicator(self.numeric_indicator(i)), alphanumeric_indicator(i)].join
    end
  end

  def coordinate_label i
    self.send("coordinate"+i.to_s+"Label")
  end

  def numeric_indicator i
    self.send("coordinate" + i.to_s + "NumericIndicator")
  end

  def alphanumeric_indicator i
    self.send("coordinate" + i.to_s + "AlphaNumIndicator")
  end

  private

  def formatted_numeric_indicator i
    if i > 0
      i.to_i.to_s
    end
  end

end
end
