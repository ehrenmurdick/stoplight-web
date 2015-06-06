require 'test_helper'

class CCUrlTest < ActiveSupport::TestCase
  attr_reader :cc_url

  def setup
    @cc_url = CCUrl.new({
      id:      1,
      url:     "url",
      user_id: 1,
    })
  end

  test 'initialize' do
    assert_equal 1,     @cc_url.user_id
    assert_equal 1,     @cc_url.id
    assert_equal 'url', @cc_url.url
  end
end
