require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should create user' do
    assert_difference('User.count') do
      post users_url, params: { user: { email: 'nina@mail.com', password: '123456' } }
    end
    assert_redirected_to user_url(User.last)
  end
  test 'should not create user' do
    assert_no_difference('User.count') do
      post users_url, params: { user: { email: 'nina', name: 'nina', password: '123456' } }
    end
  end
end
