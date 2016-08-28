module ApplicationModel
  def to_json(*args)
    to_hash.to_json(*args)
  end
end
