require 'test_helper'

class UserMapperTest < ActiveSupport::TestCase
  attr_reader :mapper

  def setup
    @mapper = UserMapper.new
    mapper.connection = FakeConnection.new
    mapper.connection.results = [{name: 'Test User'}]
  end

  test '#first returns a user' do
    assert_kind_of(User, mapper.first)
    assert_equal('Test User', mapper.first.name)
  end

  test '#all returns a list of users' do
    user = mapper.all.first
    assert_kind_of(User, user)
    assert_equal('Test User', user.name)
  end

  test '#find returns one user by id' do
    id = mapper.first.id
    assert_equal('Test User', mapper.find(id).name)
  end

  test '#find_by_email' do
    user = mapper.find_by_email('test@example.com')
    assert_equal('Test User', user.name)
  end
end
