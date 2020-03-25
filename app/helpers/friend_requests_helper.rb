module FriendRequestsHelper
  def check_status(friend)
    results = 'neutral'
    if current_user.inverted_friendships.find_by(user_id: friend).nil?
      return friend_srch(friend) unless friend_srch(friend).nil?
    else
      results = if current_user.pending_friendships.find_by(friend_id: friend).nil?
                  'pending'
                else
                  'declined'
                end
    end
    results
  end

  def creator?(friend)
    results = false
    results = true if current_user.inverted_friendships.find_by(user_id: friend).nil?
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

  private

  def friend_srch(friend)
    results = nil
    if current_user.pending_friendships.find_by(friend_id: friend).nil?
      results = 'accepted' unless current_user.confirmed_friendships.find_by(friend_id: friend).nil?
    else
      results = 'pending'
    end
    results
  end
end
