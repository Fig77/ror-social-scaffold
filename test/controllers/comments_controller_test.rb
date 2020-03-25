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
    put posts_path, params: { comment: { comment_content: 'u bad' } }
    assert_response :success, 'post could not be reached'
    assert_select 'div.post-comments', count: 1
  end
end

# class CommentsController < ApplicationController
#   def create
#     @comment = Comment.new(comment_params)
#     @comment.post_id = params[:post_id]
#     @comment.user = current_user

#     if @comment.save
#       redirect_to posts_path, notice: 'Comment was successfully created.'
#     else
#       redirect_to posts_path, alert: @comment.errors.full_messages.join('. ').to_s
#     end
#   end

#   private

#   def comment_params
#     params.require(:comment).permit(:content)
#   end
# end