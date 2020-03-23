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
end
