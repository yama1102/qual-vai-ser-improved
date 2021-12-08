class Group < ApplicationRecord
  belongs_to :user
  has_many :members
  has_many :groupedEvents, dependent: :destroy # changed from has_one, from groupedEvent to groupedEvents
  has_many :votes
  has_many :messages

  validates :name, presence: true
end
