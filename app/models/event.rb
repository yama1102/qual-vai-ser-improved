class Event < ApplicationRecord
  include PgSearch::Model
  has_many :groupedEvents, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :photo

  pg_search_scope :global_search,
  against: [:region],
  using: { tsearch: { prefix: true }}
end
