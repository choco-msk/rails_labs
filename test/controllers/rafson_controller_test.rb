require 'test_helper'

class RafsonControllerTest < ActionDispatch::IntegrationTest
  test 'test_return_json' do
    get rafson_view_url, params: { num: 100, format: 'json' }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/json'
  end
  test 'test_record_in_db' do
    before = Result.count
    get rafson_view_url, params: { num: 333 }
    after = Result.count

    assert_equal before + 1, after
  end

  test 'test_different_response_json' do
    get rafson_view_url, params: { num: 10, format: 'json' }
    first = JSON.parse @response.body

    get rafson_view_url, params: { num: 20, format: 'json' }
    second = JSON.parse @response.body

    refute_equal first, second
  end

  test 'test_different_response' do
    get rafson_view_url, params: { num: 30 }
    first = assigns[:result]
    get rafson_view_url, params: { num: 40 }
    second = assigns[:result]
    refute_equal first, second
  end
end
