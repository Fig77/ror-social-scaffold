class FriendRequestsController < ApplicationController
  def create
    redirect_to request.referrer
    @friend = current_user.friend_requests.create(:friend_id => params[:friend])
  end

  def destroy
    # current_user.friend_requests.find(params[]).destroy
    redirect_to request.referrer
  end

  def update
    redirect_to request.referrer
  end

  def friend_params
    params.require(:friend_request).permit(:friend)
  end
end
