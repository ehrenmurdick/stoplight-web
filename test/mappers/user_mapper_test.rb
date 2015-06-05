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

  test '#update updates a user' do
    user = User.new(name: 'foo', id: 1)
    assert(mapper.update(user))
    assert(mapper.connection.last_sql =~ /"name" = 'foo'/)
  end

  test '#update doesnt update a user w/o an id' do
    user = User.new
    refute(mapper.update(user))
    assert_nil(mapper.connection.last_sql)
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

  test '#insert inserts a new user' do
    user = User.new(name: 'foo')
    mapper.connection.results = 1
    assert(mapper.insert(user))
    assert_equal(1, user.id)
    assert(mapper.connection.last_sql =~ /'foo'/)
  end

  test '#insert doesnt insert a user w/ and id' do
    user = User.new(id: 1)
    refute(mapper.insert(user))
    assert_nil(mapper.connection.last_sql)
  end
end
