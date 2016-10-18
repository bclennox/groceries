require_relative 'application_model'

class Item < Sequel::Model(:items)
  include ApplicationModel

  many_to_one :trip
  many_to_one :person

  def token?
    !token.to_s.empty?
  end
end
