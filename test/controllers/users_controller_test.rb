require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { age: '18', email: 'testt@mail.ru', group: '22b',
                                        name: 'Ivan', password: 'secret', password_confirmation: 'secret', town: 'Kazan' } }
    end

  end

  test 'should get new' do
    get signin_path
    assert_response :success
  end

  test 'should get signup' do
    get signup_path :success
    assert_response :success
  end

  test 'should not create user' do
    assert_no_difference('User.count') do
      post users_url, params: { user: { email: @user.email, password: '123456' } }
    end
  end

end
