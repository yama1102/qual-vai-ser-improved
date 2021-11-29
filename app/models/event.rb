class Event < ApplicationRecord
  has_many :groupedEvents, dependent: :destroy
end
