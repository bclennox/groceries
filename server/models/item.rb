require_relative 'application_model'

class Item < Sequel::Model(:items)
  include ApplicationModel

  many_to_one :trip
  many_to_one :person
end
