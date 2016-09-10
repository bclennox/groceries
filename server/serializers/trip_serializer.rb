class TripSerializer
  include JSONAPI::Serializer

  attribute :date
  has_many :people
  has_many :items
end
