class FriendRequest < ApplicationRecord

  before_update do
    confirm_friend unless self.confirmed?
  end

  def confirm_friend
    puts self.inspect
    self.update(confirmed: true)
    FriendRequest.create!(friend_id: user_id,
                       user_id: friend_id,
                       confirmed: true)
  end

  belongs_to :user, class_name: 'User'
  belongs_to :friend, class_name: 'User'
end

#r = FriendRequest.first
#r.confirmed = true
#r.save