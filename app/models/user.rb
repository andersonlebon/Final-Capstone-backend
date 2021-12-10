class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :houses, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :name, uniqueness: true
end
