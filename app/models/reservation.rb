class Reservation < ApplicationRecord
  belongs_to :user

  has_many :houses

  # validates :rent_duration, :rent_start_date, :rent_total_price, presence: true

  # validates :rent_duration, numericality: { min: 1 }

  # validates :rent_total_price, numericality: { greater_than: 0 }
end
