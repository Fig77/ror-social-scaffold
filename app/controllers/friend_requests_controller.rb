class FriendRequestsController < ApplicationController
  def create
    @friend = current_user.FriendRequests.create(friend_params)
    redirect_to request.referrer
  end

  def destroy
    # current_user.friend_requests.find(params[]).destroy
    redirect_to request.referrer
  end

  def update
    redirect_to request.referrer
  end

  def friend_params
    params.require(:friend).permit(:status)
  end
end
