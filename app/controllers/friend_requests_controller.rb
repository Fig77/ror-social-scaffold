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

  def check_status(status, friend)
    unless current_user.friend_requests.find_by_friend(friend).nil?
      temp_status = current_user.friend_requests.find_by_status(status).status
      case temp_status
        when nil then 'pending'
        when 0 then 'accepted'
      else 'declined'
      end
    end
end
