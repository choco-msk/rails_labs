require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'login_with_good_credentials' do
    get new_session_url, params: { email: '123@mail.ru', password: '123456' }
    assert_response :success
  end
  test 'not_login_with_bad_credentials' do
    assert_raises 'InvalidHash' do
      post new_session_url, params: { email: '1233', password: '123456' }
    end
  end
  test 'should_redirect_to_signin' do
    get '/rafson/input'
    assert_response :redirect
    assert_redirected_to signin_url
  end
end
