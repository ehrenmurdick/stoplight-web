require 'test_helper'

class UserMapperTest < ActiveSupport::TestCase
  attr_reader :user_mapper
  fixtures :users
  def setup
    @user_mapper = UserMapper.new
  end

  test '#first returns a user' do
    assert_kind_of(User, user_mapper.first)
    assert_equal('Test User', user_mapper.first.name)
  end

  test '#all returns a list of users' do
    user = user_mapper.all.first
    assert_kind_of(User, user)
    assert_equal('Test User', user.name)
  end

  test '#find returns one user by id' do
    id = user_mapper.first.id
    assert_equal('Test User', user_mapper.find(id).name)
  end

  test '#find_by_email' do
    user = user_mapper.find_by_email('test@example.com')
    assert_equal('Test User', user.name)
  end
end
