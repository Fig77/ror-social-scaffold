class FriendRequest < ApplicationRecord
  scope :pending, -> { where('status = ?', nil) } # nil = pending  
  scope :rejected, -> { where('status = ?', 0) }  # 0 = rejected
  scope :accepted, -> { where('status = ?', 1) }  # 1 = accepted

end
