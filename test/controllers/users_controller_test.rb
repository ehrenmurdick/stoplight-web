require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  class FakeMapper
    attr_accessor :results
    def all; results; end
  end

  def setup
    @controller.mapper = FakeMapper.new
  end

  test '#index gets all users' do
    @controller.mapper.results = [
      User.new(name: 'test user', id: 1, email: 'email')
    ]
    get :index, format: :json
    assert_response :success
  end
end
