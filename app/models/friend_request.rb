class FriendRequest < ApplicationRecord

  def confirm_friend
    self.update_attributes(confirmed: true)
    FriendRequest.create!(friend_id: user_id,
                       user_id: friend_id,
                       confirmed: true)
  end

  belongs_to :user, class_name: 'User'
  belongs_to :friend, class_name: 'User'
end
