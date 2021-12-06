class User < ApplicationRecord
  include PgSearch::Model
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :members, dependent: :destroy
  has_many :groups
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :votes
  has_many :favorites, dependent: :destroy
  has_one_attached :photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 pg_search_scope :search_by_email,
  against: [:email],
  using: { tsearch: { prefix: true }}
end
