class User
  attr_accessor\
    :email,
    :id,
    :name,
    :password_hash

  def initialize(attrs = {})
    attrs = attrs.with_indifferent_access
    self.email         = attrs["email"]
    self.id            = attrs["id"]
    self.name          = attrs["name"]
    self.password_hash = attrs["password_hash"]
  end

  def valid_password?(password)
    BCrypt::Password.new(password_hash) == password
  end
end
