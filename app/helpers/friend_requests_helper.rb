module FriendRequestsHelper
  def check_status(friend)
    temp_status = current_user.friend_requests.find_by(friend_id: friend)
    unless temp_status.nil?
      case temp_status.status
        when nil then temp = 'pending'
        when 0 then temp = 'accepted'
      else temp = 'declined'
      end
    else
      temp = 'neutral'
    end
    temp
  end
end
