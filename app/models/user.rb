class User < BaseModel
  cattr_accessor :crypto
  self.crypto = BCrypt::Password

  attributes %w{
    email
    id
    name
    password_hash
  }

  def valid_password?(password)
    crypto.new(password_hash) == password
  end
end
