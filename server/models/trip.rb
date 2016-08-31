require_relative 'application_model'

class Trip < Sequel::Model
  include ApplicationModel

  many_to_many :people
end
