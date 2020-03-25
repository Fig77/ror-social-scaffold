module FriendRequestsHelper
  def check_status(friend)
    results = 'neutral'
    if current_user.inverted_friendships.find_by(:user_id => friend).nil?
      return friend_srch(friend) unless friend_srch(friend).nil?
    else
      if current_user.pending_friendships.find_by(:friend_id => friend).nil?
        results = 'pending'
      else
        results = 'declined'
      end
    end
    results
  end

  def creator?(friend)
    results = false
    results = true if current_user.inverted_friendships.find_by(:user_id => friend).nil?
    results
  end

  def accepted?(friend)
    results = true 
    results = false if current_user.confirmed_friendships.find_by(:friend_id => friend).nil?
    results
  end

  def declined?(friend)
    results = true
    temp = current_user.pending_friendships.find_by(:friend_id => friend)
    temp1 = current_user.inverted_friendships.find_by(:user_id => friend)
    if temp.nil? || temp1.nil?
      results = false
    end
    results
  end

  private

  def friend_srch(friend)
    results = nil
    unless current_user.pending_friendships.find_by(:friend_id => friend).nil?
      results = 'pending'
    else
      results = 'accepted' unless current_user.confirmed_friendships.find_by(:friend_id => friend).nil?
    end 
    results
  end
end
