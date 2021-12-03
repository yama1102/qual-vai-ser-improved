class Group < ApplicationRecord
  belongs_to :user
  has_many :members
  has_one :groupedEvent, dependent: :destroy
  has_many :votes

  validates :name, presence: true
end
