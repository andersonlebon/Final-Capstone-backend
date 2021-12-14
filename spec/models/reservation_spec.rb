require 'rails_helper'

RSpec.describe Reservation, type: :model do
  # Association test
  it { should belong_to(:user) }
  it { should have_and_belong_to_many(:houses) }
   # Validation tests
  it { should validate_presence_of(:rent_duration) }
  it { should validate_presence_of(:rent_start_date) }
  it { should validate_presence_of(:rent_total_price) }
  
  it { should validate_numericality_of(:rent_duration) }
  it { should validate_numericality_of(:rent_total_price).is_greater_than(0) }

end
