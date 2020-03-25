module FriendRequestsHelper
  def check_status(friend)
    temp_user = User.find(friend)
    stat = status(current_user, friend)
    stat = status(temp_user, current_user.id) if stat == 'neutral'
    stat
  end

  def friend_request_sent?(friend_id)
    result = nil
    if user_send_it?(friend_id)
      result = 0 # User Created Friend Request
    elsif friend_send_it?(friend_id)
      result = 1 # Friend Created Friend Request
    end
    result
  end

  private

  def status(user, friend)
    stat = user.friend_requests.find_by(friend_id: friend)
    if stat.nil?
      'neutral'
    else
      case stat.status
      when nil then 'pending'
      when 0 then 'accepted'
      else 'declined'
      end
    end
  end

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
