module ApplicationModel
  def to_json(*args)
    {
      type: self.class.name,
      id: id,
      attributes: serialized_attributes
    }.to_json(*args)
  end

  private

  def serialized_attributes
    to_hash.tap do |attributes|
      attributes.delete(:id)
    end
  end
end
