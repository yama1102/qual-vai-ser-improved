class Group < ApplicationRecord
  belongs_to :user
  has_many :members
  has_one :groupedEvent, dependent: :destroy

  validates :name, presence: true
end
