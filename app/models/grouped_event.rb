class GroupedEvent < ApplicationRecord
  belongs_to :group
  belongs_to :event
  has_many :votes
end
