require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  test 'should login' do
    instance = User.new(email: 'test1@mail.ru', password_digest: '12345678')
    instance.save
    get signin_url
    assert_response :success
    post sessions_url, params: { session: { email: '1231@mail.ru', password: '12345678' } }
    assert_response :success
  end
end
