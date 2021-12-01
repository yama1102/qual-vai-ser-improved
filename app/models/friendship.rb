class Friendship < ApplicationRecord
  belongs_to :user
  validates :user, uniqueness: {scope: :friend_id}
end
