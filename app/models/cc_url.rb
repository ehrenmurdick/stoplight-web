class CCUrl
  attr_accessor\
    :id,
    :url,
    :user_id

  def initialize attrs = {}
    attrs = attrs.with_indifferent_access
    self.id      = attrs[:id]
    self.url     = attrs[:url]
    self.user_id = attrs[:user_id]
  end
end
