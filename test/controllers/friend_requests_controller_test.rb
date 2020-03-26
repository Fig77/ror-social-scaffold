require 'test_helper'

class FriendRequestsControllerTest < ActionDispatch::IntegrationTest
  attr_reader :current_user

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

  test 'Update Friend Request' do
    request = friend_requests(:request_001)
    patch friend_request_path(request.user_id, params: { answer: true })
    assert_response :success
  end
end
