class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :members, dependent: :destroy
  has_many :groups
  has_many :frienships
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
