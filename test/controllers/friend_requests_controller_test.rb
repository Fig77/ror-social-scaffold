require 'test_helper'

class FriendRequestsControllerTest < ActionDispatch::IntegrationTest
  def current_user
    @current_user
  end

  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
  end

  test 'Create Friend Request' do
    user = users(:user_002)
    post friend_requests_path, params: { friend: user.id }
    assert_response :success
  end

  test 'Delete Friend Request' do
    request = friend_requests(:request_001)
    delete friend_request_path(request.friend_id)
    assert_response :success
  end
  
  test 'Update Friend Request' do
    request = friend_requests(:request_003)
    patch friend_request_path(request.creator_id, params: { whatever: 1 })
    assert_response :success
  end
end
