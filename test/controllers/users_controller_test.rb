require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  attr_reader :current_user

  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
  end

  test 'Will get all users when getting to indes' do
    get users_path
    assert_response :success, 'users could not be reached'
    assert_select 'li', count: 3
  end

  test 'Will show a specific  user' do
    get user_path(users(:user_002).id)
    assert_response :success
  end
end
