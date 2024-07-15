require 'rails_helper'

RSpec.describe DailyOverview, type: :model do
  # Setup valid attribues to use for tests
  let(:valid_attributes) {
      {date: Date.today}
  }
  let(:duplicate_attributes) {
    {date: Date.today}
}

    # Check that the factory is valid
    it 'is valid with valid attributes' do
      expect(DailyOverview.new(valid_attributes)).to be_valid
    end

    # Check for uniqueness validation
    it 'is invalid if DailyOverview with same date exists' do
      DailyOverview.create!(valid_attributes)
      expect(DailyOverview.new(duplicate_attributes)).to_not be_valid
    end
end
