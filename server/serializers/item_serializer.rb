class ItemSerializer
  include JSONAPI::Serializer

  attribute :value
  has_one :trip
  has_one :person
end
