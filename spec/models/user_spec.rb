require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  it { should have_many(:houses) }
  it { should have_many(:reservations) }

  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(50) }
  it { should validate_uniqueness_of(:name) }
end
