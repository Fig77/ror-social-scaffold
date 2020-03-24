require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def current_user
    @current_user
  end

  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
    #posts(:post_001).user = users(:user_001)
    #posts(:post_001).user = users(:user_001)

  end

  test 'Will return all posts' do
    puts posts(:post_001).user.id
  end

  test 'Will create a new post' do

  end
end

  # ###
  # def index
  #   @post = Post.new
  #   timeline_posts
  # end

  # def create
  #   @post = current_user.posts.new(post_params)

  #   if @post.save
  #     redirect_to posts_path, notice: 'Post was successfully created.'
  #   else
  #     timeline_posts
  #     render :index, alert: 'Post was not created.'
  #   end
  # end

  # private

  # def timeline_posts
  #   @timeline_posts ||= Post.all.ordered_by_most_recent.includes(:user)
  # end

  # def post_params
  #   params.require(:post).permit(:content)
  # end