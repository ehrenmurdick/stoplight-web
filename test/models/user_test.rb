require 'test_helper'

class UserTest < ActiveSupport::TestCase
  attr_reader :user
  def setup
    @user = User.new({
      email: "test@example.com",
      id: 1,
      name: "Test User"
    }.stringify_keys)
    User.crypto = FakeCrypto
  end

  test '#valid_password?' do
    user.password_hash = 'password'
    assert(user.valid_password?('password'))
  end

  test 'failing' do
    assert false
  end
end
