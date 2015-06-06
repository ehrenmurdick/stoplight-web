class BaseModel
  def self.attributes attrs
    attr_accessor *attrs
    define_method(:columns) { attrs }
  end

  def initialize(attrs = {})
    attrs.stringify_keys!
    attrs.assert_valid_keys(columns)
    attrs.map {|k, v| send("#{k}=", v) }
  end
end
