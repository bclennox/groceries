class ItemSerializer
  include JSONAPI::Serializer

  attribute :value
  has_one :trip
  has_one :person

  attribute :editable do
    @object.token? && @object.token == @context[:item_token]
  end
end
