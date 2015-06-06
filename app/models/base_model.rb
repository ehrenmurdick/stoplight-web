class BaseModel
  def self.attributes attrs
    attrs = attrs.map(&:to_s)
    attr_accessor *attrs
    define_method(:columns) { attrs }
  end

  def initialize(attrs = {})
    attrs.stringify_keys!
    columns.each do |column|
      send("#{column}=", attrs[column])
    end
  end
end
