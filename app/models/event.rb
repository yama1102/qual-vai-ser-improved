class Event < ApplicationRecord
  has_many :groupedEvents, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
