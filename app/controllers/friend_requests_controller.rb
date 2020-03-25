class FriendRequestsController < ApplicationController
  def create
    @friend = current_user.friend_requests.create(friend_id: params[:friend])
    redirect_to request.referrer unless request.referrer.nil?
  end

  def destroy
    current_user.friend_requests.find_by(friend_id: params[:id]).delete
    redirect_to request.referrer unless request.referrer.nil?
  end

  def update
    temp = current_user.inverse_friendships.find_by(creator_id: params[:id])
    temp.status = params[:whatever]
    temp.save
    redirect_to request.referrer unless request.referrer.nil?
  end
  
  private

  def friend_params
    params.require(:friend_request).permit(:friend)
  end
end
