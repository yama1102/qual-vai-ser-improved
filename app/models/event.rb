class Event < ApplicationRecord
  has_many :groupedEvents, dependent: :destroy
  has_one_attached :photo
end
