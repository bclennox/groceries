class JsonApiSerializer
  attr_accessor :source

  def initialize(source, relationships: [], top: true, minimal: false)
    @source = source
    @relationships = Array(relationships)
    @top = !!top
    @minimal = !!minimal
  end

  def as_json
    if top
      top_level
    elsif minimal
      resource_identifier
    else
      everything
    end
  end

  def to_json
    as_json.to_json
  end

  private

  attr_reader :source, :relationships, :top, :minimal

  def top_level
    { data: everything }.tap do |t|
      t[:included] = included_objects if include_relationships?
    end
  end

  def everything
    resource_identifier.merge(attributes: attributes).tap do |object|
      object[:relationships] = relationships_objects if include_relationships?
    end
  end

  def resource_identifier
    { type: source.class.name, id: source.id }
  end

  def attributes
    source.values.dup.tap do |attr|
      attr.delete(:id)
    end
  end

  def include_relationships?
    relationships.any?
  end

  def relationships_objects
    relationships.inject({}) do |memo, relationship|
      objects = source.public_send(relationship).map do |object|
        self.class.new(object, top: false, minimal: true).as_json
      end

      memo[relationship] = { data: objects }
      memo
    end
  end

  def included_objects
    relationships.flat_map do |relationship|
      source.public_send(relationship).map do |object|
        self.class.new(object, top: false).as_json
      end
    end
  end
end
