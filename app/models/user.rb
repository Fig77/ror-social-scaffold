class User < ApplicationRecord
  # Includinverse_friendshipse default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  ##
  ## Friend Request Confimed
  has_many :confirmed_friendships, -> { where confirmed: true }, class_name: 'FriendRequest'
  has_many :friends, through: :confirmed_friendships
  ##
  ## Friend Request Pending
  has_many :pending_friendships, -> { where confirmed: false }, class_name: 'FriendRequest', foreign_key: 'user_id'
  has_many :pending_friends, through: :pending_friendships, source: :friend
  ##
  ## Friend Request Inverted
  has_many :inverted_friendships, -> { where confirmed: false }, class_name: 'FriendRequest', foreign_key: 'friend_id'
  has_many :friend_requests, through: :inverted_friendships

  has_many :create_friend, foreign_key: :user_id
end
