require 'test_helper'

class CcUrlsControllerTest < ActionController::TestCase
  def setup
    @controller.mapper = FakeMapper.new
  end

  test '#index gets all urls' do
    @controller.mapper.results = [CCUrl.new]
    get :index, format: :json
    assert_response :success
  end
end
