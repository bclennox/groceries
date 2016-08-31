require_relative 'application_model'

class Person < Sequel::Model(:people)
  include ApplicationModel

  many_to_many :trips
end
