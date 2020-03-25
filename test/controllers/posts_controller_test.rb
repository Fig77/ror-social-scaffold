require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def current_user
    @current_user
  end

  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
  end

  test 'Will show all created posts in post route' do
    get posts_path
    assert_response :success, 'Path could not be reached'
    assert_select 'li', count: 2
  end

  test 'Will create a new post' do
    post posts_path, params: { post: { post_content: 'no u' } }
    assert_response :success, 'Post could not be created'
  end
end
