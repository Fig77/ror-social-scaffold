class FriendRequestsController < ApplicationController
  def create
    @friend = current_user.pending_friendships.create(friend_id: params[:friend])
    redirect_to request.referrer unless request.referrer.nil?
  end

  def destroy
    current_user.pending_friendships.find_by(friend_id: params[:id]).delete
    redirect_to request.referrer unless request.referrer.nil?
  end

  def update
    temp = current_user.inverse_friendships.find_by(creator_id: params[:id])
    temp.status = params[:whatever]
    puts self.confirmed.inspect
    temp.save
    redirect_to request.referrer unless request.referrer.nil?
  end

  private

  def confirm_friend
    self.update_attributes(confirmed: true)
    Friendship.create!(friend_id: self.user_id,
                    user_id: self.friend_id,
                    confirmed: true)
  end

  def friend_params
    params.require(:friend_request).permit(:friend)
  end
end
