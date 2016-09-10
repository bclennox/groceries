class PersonSerializer
  include JSONAPI::Serializer

  attribute :name
  has_many :trips
end
