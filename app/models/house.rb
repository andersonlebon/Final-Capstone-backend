class House < ApplicationRecord
  belongs_to :user

  has_many :reservations

  # validates :house_description, presence: true, length: { maximum: 150 }

  # validates :title, :image, :location, :price, :availability, :discount, presence: true

  # validates :title, uniqueness: true, length: { maximum: 50 }

  # validates :discount, :price, numericality: { min: 0 }
end
