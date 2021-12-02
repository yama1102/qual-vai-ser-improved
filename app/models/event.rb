class Event < ApplicationRecord
  has_many :groupedEvents, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
