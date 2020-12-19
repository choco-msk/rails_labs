require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest
  setup do
    post users_url, params: { user: { age: '18', email: 'testt@mail.ru', group: '22b', name: 'Ivan', password: 'secret', town: 'Kazan' } }
    post sessions_url, params: { session: { email: 'testt@mail.ru', password: 'secret' } }
  end

  test 'should go to posts' do
    get posts_path
    assert_response :success
  end

  test 'should create post' do
    post posts_path(params: {post: { title: '123', body: 'fff', author_id: '1'}})
    assert_response :redirect
    assert_redirected_to posts_path
  end

  test 'should do to profile' do
    get user_url(User.find_by_email('testt@mail.ru'))
    assert_response :success
  end

end