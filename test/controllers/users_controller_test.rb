require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @controller.mapper = FakeMapper.new
  end

  test '#index gets all users' do
    @controller.mapper.results = [User.new]
    get :index, format: :json
    assert_response :success
  end

  test '#show shows a user' do
    @controller.mapper.results = User.new
    get :show, id: 1, format: :json
    assert_response :success
  end

  test '#show renders 404 if user isnt found' do
    @controller.mapper.results = nil
    get :show, id: 1, format: :json
    assert_response :not_found
  end
end
