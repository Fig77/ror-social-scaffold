require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def current_user
    @current_user
  end

  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
  end

  test 'Will get all users when getting to indes' do
    get users_path
    assert_response :success
  end

  test 'Will show a specific  user' do
  	get user_path(users(:user_002).id)
    assert_response :success
  end
end