class Event < ApplicationRecord
  include PgSearch::Model
  has_many :groupedEvents, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :photo

  pg_search_scope :search_by_name_region_and_date,
  against: [:region, :name, :date],
  using: { tsearch: { prefix: true }}
end
