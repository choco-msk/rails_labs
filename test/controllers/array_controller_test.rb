require 'test_helper'

class ArrayControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get array_input_url
    assert_response :success
  end

  test "should get view" do
    get array_view_url
    assert_response :success
  end

end
