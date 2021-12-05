class Friendship < ApplicationRecord
  belongs_to :user
  validates :user, uniqueness: {scope: :friend_id}

  # include PgSearch::Model
  # pg_search_scope :global_search,
  #  against: [:email],
  #  associated_against:{
  #     user: [:email]
  #   },
  #   using: { tsearch: { prefix: true }
  # }
end
