require 'rails_helper'

RSpec.describe House, type: :model do
  # Association test
  it { should belong_to(:user) }
  it { should have_and_belong_to_many(:reservations) }
   # Validation tests
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:availability) }
  it { should validate_presence_of(:discount) }
  it { should validate_presence_of(:house_description) }
  it { should validate_numericality_of(:price) }
  it { should validate_numericality_of(:discount) }
  it {
    should validate_length_of(:house_description)
      .is_at_most(150)   }
end