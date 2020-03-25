class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def timeline_posts
    find_friend_by_me = current_user.friend_requests.all.where(status: 0).select(:friend_id)
    find_friend_by_friends = current_user.inverse_friendships.all.where(status: 0).select(:creator_id)
    temp1 = Post.all.ordered_by_most_recent.includes(:user).where(user: find_friend_by_me)
    temp2 = Post.all.ordered_by_most_recent.includes(:user).where(user: current_user)
    temp3 = Post.all.ordered_by_most_recent.includes(:user).where(user: find_friend_by_friends)
    @timeline_posts ||= temp1.or(temp2).or(temp3)
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
