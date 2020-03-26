class FriendRequest < ApplicationRecord
  def answer_request(boolean)
    update_attributes(confirmed: boolean)
    FriendRequest.create!(friend_id: user_id,
                          user_id: friend_id,
                          confirmed: boolean)
  end

  belongs_to :user, class_name: 'User'
  belongs_to :friend, class_name: 'User'
end
