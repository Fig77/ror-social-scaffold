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
    post friend_requests_path, params: { friend: 1  }
    assert_response :success
  end
  #  test 'should get destroy' do
  #    get friend_requests_destroy_url
  #    assert_response :success
  #  end
  #
  #  test 'should get update' do
  #    get friend_requests_update_url
  #    assert_response :success
  #  end
end
