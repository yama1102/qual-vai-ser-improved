class Group < ApplicationRecord
  belongs_to :user
  has_many :members
  has_one :groupedEvent, dependent: :destroy
  has_many :votes
  has_many :messages

  validates :name, presence: true
end
