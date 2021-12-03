class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, :event, uniqueness: true
end
