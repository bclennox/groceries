module ApplicationModel
  def to_json_api(options = {})
    JSONAPI::Serializer.serialize(self, options.merge(skip_collection_check: true)).to_json
  end
end
