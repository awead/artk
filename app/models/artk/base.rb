module Artk
class Base < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "artk_#{Rails.env}"
end
end