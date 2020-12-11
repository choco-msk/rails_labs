require 'test_helper'

class RafsonControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get rafson_input_url
    assert_response :success
  end
  test "should get incorrect" do
    get rafson_view_url, params: {num: "fggf"}
    assert_equal assigns[:result], "Error"
  end
  test "should get correct" do
      get rafson_view_url, params: {num: "16"}
      res = assigns[:result][-1]
      assert_in_delta res,4,0.001
  end
end

