class FriendRequestsController < ApplicationController
  def create
    redirect_to request.referrer
    @friend = current_user.friend_requests.create(friend_id: params[:friend])
  end

  def destroy
    current_user.friend_requests.find_by(friend_id: params[:id]).delete
    redirect_to request.referrer
  end

  def update
    temp = User.find(params[:id])
    temp = temp.friend_requests.find_by(friend_id: current_user.id)
    temp.status = params[:whatever]
    temp.save
    redirect_to request.referrer
  end

  def friend_params
    params.require(:friend_request).permit(:friend)
  end
end
