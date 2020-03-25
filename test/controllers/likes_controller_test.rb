class LikesControllerTest < ActionDispatch::IntegrationTest
	setup do
    get '/users/sign_in'
		sign_in users(:user_001)
    post user_session_url
	end

	test 'Get Post Page' do
		get posts_path
		assert_response :success
	end

	test 'Create Like Request' do
    post = posts(:post_001)
		post post_likes_path(post)
		get posts_path
		assert_response :success
	end
	
	test 'Destroy Like Request' do
		like = likes(:like_001)
		delete post_like_path(like,like.post_id)
		get posts_path
		assert_response :success
	end

end