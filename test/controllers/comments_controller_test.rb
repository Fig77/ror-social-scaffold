require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  def current_user
    @current_user
  end

  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
  end

  test 'Will create a new comment' do
    post = posts(:post_001)
    post posts_path, 
                   params: { post: { post_id: post.id }, 
                   comment: { comment_content: 'u bad' } }
    assert_response :success, 'post could not be reached'
    assert_select 'div.post-comments', count: 1
  end
end
