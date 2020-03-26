module FriendRequestsHelper
  def check_status(friend)
    return 'declined' if declined?(friend)
    return 'pending' if pending?(friend)
    return 'accepted' if accepted?(friend)
    'neutral'
  end

  def creator?(friend)
    results = false
    results = true if current_user.inverted_friendships.find_by(user_id: friend).nil?
    results
  end

  def pending?(friend)
    results = true
    temp = current_user.pending_friendships.find_by(friend_id: friend)
    temp1 = current_user.inverted_friendships.find_by(user_id: friend)
    results = false if temp.nil? && temp1.nil?
    results
  end

  def accepted?(friend)
    results = true
    results = false if current_user.confirmed_friendships.find_by(friend_id: friend).nil?
    results
  end

  def declined?(friend)
    results = true
    temp = current_user.pending_friendships.find_by(friend_id: friend)
    temp1 = current_user.inverted_friendships.find_by(user_id: friend)
    results = false if temp.nil? || temp1.nil?
    results
  end
end
