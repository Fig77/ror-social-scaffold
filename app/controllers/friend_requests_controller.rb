class FriendRequestsController < ApplicationController
  def create
    @friend = current_user.pending_friendships.create(friend_id: params[:friend])
    redirect_to request.referrer unless request.referrer.nil?
  end

  def update
    current_user.inverted_friendships.find_by(user_id: params[:id]).answer_request(params[:answer])
    redirect_to request.referrer unless request.referrer.nil?
  end

  private

  def friend_params
    params.require(:friend_request).permit(:friend)
  end
end
