class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :grouped_event
end
