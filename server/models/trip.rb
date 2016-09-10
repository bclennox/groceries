require_relative 'application_model'

class Trip < Sequel::Model
  include ApplicationModel

  many_to_many :people
  one_to_many :items

  def self.latest
    reverse_order(:date).first
  end
end
