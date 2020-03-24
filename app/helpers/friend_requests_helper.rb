module FriendRequestsHelper
  def check_status(friend)
    temp_status = current_user.friend_requests.find_by(friend_id: friend)
    temp = if temp_status.nil?
             'neutral'
           else
             case temp_status.status
             when nil then 'pending'
             when 0 then 'accepted'
             else 'declined'
             end
           end
    temp
  end

  def friend_request_sent?(friend_id)
    result = nil
    if user_send_it?(friend_id)
      result = 0            # User Created Friend Request
    elsif friend_send_it?(friend_id)
      result = 1            # Friend Created Friend Request
    end
    result
  end

  private

  def user_send_it?(friend_id)
    bool = true
    temp_request = current_user.friend_requests.find_by(friend_id: friend_id)
    bool = false if temp_request.nil?
    bool
  end

  def friend_send_it?(friend_id)
    bool = true
    temp_user = User.find(friend_id)
    temp_request = temp_user.friend_requests.find_by(friend_id: current_user.id)
    bool = false if temp_request.nil?
    bool
  end
end
